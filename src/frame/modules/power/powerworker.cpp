/*
 * Copyright (C) 2011 ~ 2018 Deepin Technology Co., Ltd.
 *
 * Author:     sbw <sbw@sbw.so>
 *             kirigaya <kirigaya@mkacg.com>
 *             Hualet <mr.asianwang@gmail.com>
 *
 * Maintainer: sbw <sbw@sbw.so>
 *             kirigaya <kirigaya@mkacg.com>
 *             Hualet <mr.asianwang@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "powerworker.h"
#include "powermodel.h"
#include "widgets/utils.h"

#include <QProcessEnvironment>

#define POWER_CAN_SLEEP "POWER_CAN_SLEEP"
#define POWER_CAN_HIBERNATE "POWER_CAN_HIBERNATE"

using namespace dcc;
using namespace dcc::power;

PowerWorker::PowerWorker(PowerModel *model, QObject *parent)
    : QObject(parent)
    , m_powerModel(model)
    , m_powerInter(new PowerInter("com.deepin.daemon.Power", "/com/deepin/daemon/Power", QDBusConnection::sessionBus(), this))
    , m_sysPowerInter(new SysPowerInter("com.deepin.system.Power", "/com/deepin/system/Power", QDBusConnection::systemBus(), this))
    , m_login1ManagerInter(new Login1ManagerInter("org.freedesktop.login1", "/org/freedesktop/login1", QDBusConnection::systemBus(), this))
{

    connect(m_powerInter, &PowerInter::ScreenBlackLockChanged, m_powerModel, &PowerModel::setScreenBlackLock);
    connect(m_powerInter, &PowerInter::SleepLockChanged, m_powerModel, &PowerModel::setSleepLock);
    connect(m_powerInter, &PowerInter::LidIsPresentChanged, m_powerModel, &PowerModel::setLidPresent);
    connect(m_powerInter, &PowerInter::LidClosedSleepChanged, m_powerModel, &PowerModel::setSleepOnLidOnPowerClose);
//    connect(m_powerInter, &PowerInter::BatteryLidClosedSleepChanged, m_powerModel, &PowerModel::setSleepOnLidOnBatteryClose);
    connect(m_powerInter, &PowerInter::LinePowerScreenBlackDelayChanged, this, &PowerWorker::setScreenBlackDelayToModelOnPower);
    connect(m_powerInter, &PowerInter::LinePowerSleepDelayChanged, this, &PowerWorker::setSleepDelayToModelOnPower);
    connect(m_powerInter, &PowerInter::BatteryScreenBlackDelayChanged, this, &PowerWorker::setScreenBlackDelayToModelOnBattery);
    connect(m_powerInter, &PowerInter::BatterySleepDelayChanged, this, &PowerWorker::setSleepDelayToModelOnBattery);
    connect(m_powerInter, &PowerInter::BatteryLockDelayChanged, this, &PowerWorker::setResponseBatteryLockScreenDelay);
    connect(m_powerInter, &PowerInter::LinePowerLockDelayChanged, this, &PowerWorker::setResponsePowerLockScreenDelay);
#ifndef DCC_DISABLE_POWERSAVE
    connect(m_sysPowerInter, &SysPowerInter::PowerSavingModeAutoChanged, m_powerModel, &PowerModel::setAutoPowerSaveMode);
    connect(m_sysPowerInter, &SysPowerInter::PowerSavingModeEnabledChanged, m_powerModel, &PowerModel::setPowerSaveMode);
#endif
    connect(m_sysPowerInter, &SysPowerInter::HasBatteryChanged, m_powerModel, &PowerModel::setHaveBettary);
    connect(m_sysPowerInter, &SysPowerInter::BatteryPercentageChanged, m_powerModel, &PowerModel::setBatteryPercentage);


    //--------------------sp2 add----------------------------
    connect(m_sysPowerInter, &SysPowerInter::PowerSavingModeAutoWhenBatteryLowChanged, m_powerModel, &PowerModel::setPowerSavingModeAutoWhenQuantifyLow);
    connect(m_sysPowerInter, &SysPowerInter::PowerSavingModeAutoChanged, m_powerModel, &PowerModel::setPowerSavingModeAuto);
    connect(m_sysPowerInter, &SysPowerInter::PowerSavingModeBrightnessDropPercentChanged, m_powerModel, &PowerModel::setPowerSavingModeLowerBrightnessThreshold);
    connect(m_powerInter, &PowerInter::LinePowerPressPowerBtnActionChanged, m_powerModel, &PowerModel::setLinePowerPressPowerBtnAction);
    connect(m_powerInter, &PowerInter::LinePowerLidClosedActionChanged, m_powerModel, &PowerModel::setLinePowerLidClosedAction);
    connect(m_powerInter, &PowerInter::BatteryPressPowerBtnActionChanged, m_powerModel, &PowerModel::setBatteryPressPowerBtnAction);
    connect(m_powerInter, &PowerInter::BatteryLidClosedActionChanged, m_powerModel, &PowerModel::setBatteryLidClosedAction);
    connect(m_powerInter, &PowerInter::LowPowerNotifyEnableChanged, m_powerModel, &PowerModel::setLowPowerNotifyEnable);
    connect(m_powerInter, &PowerInter::LowPowerNotifyThresholdChanged, m_powerModel, &PowerModel::setLowPowerNotifyThreshold);
    connect(m_powerInter, &PowerInter::LowPowerAutoSleepThresholdChanged, m_powerModel, &PowerModel::setLowPowerAutoSleepThreshold);
    //-------------------------------------------------------

    QProcessEnvironment env = QProcessEnvironment::systemEnvironment();
    bool envVal = QVariant(env.value(POWER_CAN_SLEEP)).toBool();
    bool confVal = valueByQSettings<bool>(DCC_CONFIG_FILES, "Power", "sleep", true);
    bool dbusVal = m_login1ManagerInter->CanSuspend().value().contains("yes");
    qDebug() << "envVal: " << envVal << " confVal: " << confVal << " dbusVal: " << dbusVal;
    bool can_sleep = env.contains(POWER_CAN_SLEEP) ? envVal : confVal && dbusVal;
    m_powerModel->setCanSleep(can_sleep);
}

void PowerWorker::active(bool isSync)
{
    m_powerInter->blockSignals(false);

    m_powerInter->setSync(isSync);
    // refersh data
    m_powerModel->setScreenBlackLock(m_powerInter->screenBlackLock());
    m_powerModel->setSleepLock(m_powerInter->sleepLock());
    m_powerModel->setLidPresent(m_powerInter->lidIsPresent());
    m_powerModel->setSleepOnLidOnPowerClose(m_powerInter->lidClosedSleep());
    m_powerModel->setHaveBettary(m_sysPowerInter->hasBattery());
    m_powerModel->setPowerSavingModeAutoWhenQuantifyLow(m_sysPowerInter->powerSavingModeAutoWhenBatteryLow());
    m_powerModel->setPowerSavingModeLowerBrightnessThreshold(m_sysPowerInter->powerSavingModeBrightnessDropPercent());
    m_powerModel->setLowPowerNotifyEnable(m_powerInter->lowPowerNotifyEnable());
    m_powerModel->setLowPowerAutoSleepThreshold(m_powerInter->lowPowerAutoSleepThreshold());
    m_powerModel->setLowPowerNotifyThreshold(m_powerInter->lowPowerNotifyThreshold());
    m_powerModel->setLinePowerPressPowerBtnAction(m_powerInter->linePowerPressPowerBtnAction());
    m_powerModel->setLinePowerLidClosedAction(m_powerInter->linePowerLidClosedAction());
    m_powerModel->setBatteryPressPowerBtnAction(m_powerInter->batteryPressPowerBtnAction());
    m_powerModel->setBatteryLidClosedAction(m_powerInter->batteryLidClosedAction());

    setScreenBlackDelayToModelOnPower(m_powerInter->linePowerScreenBlackDelay());
    setSleepDelayToModelOnPower(m_powerInter->linePowerSleepDelay());

    setScreenBlackDelayToModelOnBattery(m_powerInter->batteryScreenBlackDelay());
    setSleepDelayToModelOnBattery(m_powerInter->batterySleepDelay());

    setResponseBatteryLockScreenDelay(m_powerInter->batteryLockDelay());
    setResponsePowerLockScreenDelay(m_powerInter->linePowerLockDelay());

#ifndef DCC_DISABLE_POWERSAVE
    m_powerModel->setAutoPowerSaveMode(m_sysPowerInter->powerSavingModeAuto());
    m_powerModel->setPowerSaveMode(m_sysPowerInter->powerSavingModeEnabled());
#endif
    m_powerInter->setSync(false);
}

void PowerWorker::deactive()
{
    m_powerInter->blockSignals(true);
}

void PowerWorker::setScreenBlackLock(const bool lock)
{
    m_powerInter->setScreenBlackLock(lock);
}

void PowerWorker::setSleepLock(const bool lock)
{
    m_powerInter->setSleepLock(lock);
}

void PowerWorker::setSleepOnLidOnPowerClosed(const bool sleep)
{
    m_powerInter->setLidClosedSleep(sleep);
}

void PowerWorker::setSleepDelayOnPower(const int delay)
{
    qDebug() << "m_powerInter->setLinePowerSleepDelay: " << converToDelayDBus(delay);
    m_powerInter->setLinePowerSleepDelay(converToDelayDBus(delay));
}

void PowerWorker::setSleepDelayOnBattery(const int delay)
{
    qDebug() << "m_powerInter->setBatterySleepDelay: " << converToDelayDBus(delay);
    m_powerInter->setBatterySleepDelay(converToDelayDBus(delay));
}

void PowerWorker::setScreenBlackDelayOnPower(const int delay)
{
    qDebug() << "m_powerInter->setLinePowerScreenBlackDelay: " << converToDelayDBus(delay);
    m_powerInter->setLinePowerScreenBlackDelay(converToDelayDBus(delay));
}

void PowerWorker::setScreenBlackDelayOnBattery(const int delay)
{
    qDebug() << "m_powerInter->setBatteryScreenBlackDelay: " << converToDelayDBus(delay);
    m_powerInter->setBatteryScreenBlackDelay(converToDelayDBus(delay));
}

void PowerWorker::setSleepDelayToModelOnPower(const int delay)
{
    m_powerModel->setSleepDelayOnPower(converToDelayModel(delay));
}

void PowerWorker::setScreenBlackDelayToModelOnPower(const int delay)
{
    m_powerModel->setScreenBlackDelayOnPower(converToDelayModel(delay));
}

void PowerWorker::setSleepDelayToModelOnBattery(const int delay)
{
    m_powerModel->setSleepDelayOnBattery(converToDelayModel(delay));
}

void PowerWorker::setResponseBatteryLockScreenDelay(const int delay)
{
    m_powerModel->setBatteryLockScreenDelay(converToDelayModel(delay));
}

void PowerWorker::setResponsePowerLockScreenDelay(const int delay)
{
    m_powerModel->setPowerLockScreenDelay(converToDelayModel(delay));
}

void PowerWorker::setPowerSavingModeAutoWhenQuantifyLow(bool bLowBatteryAutoIntoSaveEnergyMode)
{
    m_sysPowerInter->setPowerSavingModeAutoWhenBatteryLow(bLowBatteryAutoIntoSaveEnergyMode);
}

void PowerWorker::setPowerSavingModeAuto(bool bAutoIntoSaveEnergyMode)
{
    m_sysPowerInter->setPowerSavingModeAuto(bAutoIntoSaveEnergyMode);
}

void PowerWorker::setPowerSavingModeLowerBrightnessThreshold(uint dPowerSavingModeLowerBrightnessThreshold)
{
    m_sysPowerInter->setPowerSavingModeBrightnessDropPercent(dPowerSavingModeLowerBrightnessThreshold);
}

void PowerWorker::setLinePowerPressPowerBtnAction(int nLinePowerPressPowerBtnAction)
{
    m_powerInter->setLinePowerPressPowerBtnAction(nLinePowerPressPowerBtnAction);
}

void PowerWorker::setLinePowerLidClosedAction(int nLinePowerLidClosedAction)
{
    m_powerInter->setLinePowerLidClosedAction(nLinePowerLidClosedAction);
}

void PowerWorker::setBatteryPressPowerBtnAction(int nBatteryPressPowerBtnAction)
{
    m_powerInter->setBatteryPressPowerBtnAction(nBatteryPressPowerBtnAction);
}

void PowerWorker::setBatteryLidClosedAction(int nBatteryLidClosedAction)
{
    m_powerInter->setBatteryLidClosedAction(nBatteryLidClosedAction);
}

void PowerWorker::setLowPowerNotifyEnable(bool bLowPowerNotifyEnable)
{
    m_powerInter->setLowPowerNotifyEnable(bLowPowerNotifyEnable);
}

void PowerWorker::setLowPowerNotifyThreshold(int dLowPowerNotifyThreshold)
{
    m_powerInter->setLowPowerNotifyThreshold(dLowPowerNotifyThreshold);
}

void PowerWorker::setLowPowerAutoSleepThreshold(int dLowPowerAutoSleepThreshold)
{
    m_powerInter->setLowPowerAutoSleepThreshold(dLowPowerAutoSleepThreshold);
}

void PowerWorker::setScreenBlackDelayToModelOnBattery(const int delay)
{
    m_powerModel->setScreenBlackDelayOnBattery(converToDelayModel(delay));
}

void PowerWorker::setLockScreenDelayOnBattery(const int delay)
{
    qDebug() << "m_powerInter->setBatteryLockDelay: " << converToDelayDBus(delay);
    m_powerInter->setBatteryLockDelay(converToDelayDBus(delay));
}

void PowerWorker::setLockScreenDelayOnPower(const int delay)
{
    qDebug() << "m_powerInter->setLinePowerLockDelay: " << converToDelayDBus(delay);
    m_powerInter->setLinePowerLockDelay(converToDelayDBus(delay));
}

#ifndef DCC_DISABLE_POWERSAVE
void PowerWorker::setEnablePowerSave(const bool isEnable)
{
    m_sysPowerInter->setPowerSavingModeEnabled(isEnable);
}

void PowerWorker::setAutoEnablePowerSave(const bool isEnable)
{
    m_sysPowerInter->setPowerSavingModeAuto(isEnable);
}
#endif

int PowerWorker::converToDelayModel(int value)
{
    if (value == 0) {
        return 7;
    }

    if (value <= 60) {
        return 1;
    } else if (value <= 300) {
        return 2;
    } else if (value <= 600) {
        return 3;
    } else if (value <= 900) {
        return 4;
    } else if (value <= 1800) {
        return 5;
    } else {
        return 6;
    }
}

int PowerWorker::converToDelayDBus(int value)
{
    switch (value) {
    case 1:
        return 60;
    case 2:
        return 300;
    case 3:
        return 600;
    case 4:
        return 900;
    case 5:
        return 1800;
    case 6:
        return 3600;
    case 7:
        return 0;
    default:
        return 900;
    }
}
