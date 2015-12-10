
#include "complexplugin.h"

#include <QLabel>
#include <QFile>
#include <QDBusConnection>
#include "complexapplet.h"
#include "complexitem.h"

using namespace NetworkPlugin;
const QString COMPLEX_NETWORK_PLUGIN_ID = "complex_network_plugin_id";
ComplexPlugin::ComplexPlugin()
{
    m_dbusNetwork = new com::deepin::daemon::DBusNetwork(this);

    initSettings();
}

ComplexPlugin::~ComplexPlugin()
{
    qDebug() << "[ComplexNetworkPlugin] ComplexNetworkPlugin Destroyed!";
}

void ComplexPlugin::init(DockPluginProxyInterface *proxy)
{
    m_proxy = proxy;
    m_mode = proxy->dockMode();
    m_complexItem = nullptr;
    m_applet = nullptr;
    //for init
    if (m_mode == Dock::FashionMode) {
        onEnabledChanged();
    }
}

QString ComplexPlugin::getPluginName()
{
    return tr("Network");
}

QStringList ComplexPlugin::ids()
{
    return QStringList(COMPLEX_NETWORK_PLUGIN_ID);
}

QString ComplexPlugin::getName(QString id)
{
    Q_UNUSED(id);

    return tr("Network");
}

QString ComplexPlugin::getTitle(QString id)
{
    return getName(id);
}

QString ComplexPlugin::getCommand(QString)
{
    return "dde-control-center network";
}

QPixmap ComplexPlugin::getIcon(QString)
{
    QPixmap icon(":/images/images/wire_on.png");
    return icon.scaled(Dock::APPLET_EFFICIENT_ICON_SIZE, Dock::APPLET_EFFICIENT_ICON_SIZE);
}

bool ComplexPlugin::configurable(const QString &id)
{
    Q_UNUSED(id);

    return m_mode == Dock::FashionMode;
}

bool ComplexPlugin::enabled(const QString &id)
{
    return m_settings->value(settingEnabledKey(id), true).toBool();    //default enabled
}

void ComplexPlugin::setEnabled(const QString &id, bool enabled)
{
    if (m_mode != Dock::FashionMode)
        return;

    m_settings->setValue(settingEnabledKey(id), enabled);

    onEnabledChanged();
}

QWidget * ComplexPlugin::getApplet(QString id)
{
    Q_UNUSED(id)

    if (!m_dbusNetwork->isValid() || m_mode != Dock::FashionMode)
        return NULL;

    if (m_applet == nullptr) {
        m_applet = new ComplexApplet;
        connect(m_applet, &ComplexApplet::sizeChanged, [=]{
            m_proxy->infoChangedEvent(DockPluginInterface::AppletSize, COMPLEX_NETWORK_PLUGIN_ID);
        });
    }

    return m_applet;
}

QWidget * ComplexPlugin::getItem(QString id)
{
    if (m_mode != Dock::FashionMode) {
        return NULL;
    }
    else if (enabled(id)) {
        if (m_complexItem == nullptr)
            addNewItem(id);

        return m_complexItem;
    }
    else {
        return NULL;
    }
}

void ComplexPlugin::changeMode(Dock::DockMode newMode, Dock::DockMode oldMode)
{
    m_mode = newMode;
    if (m_dbusNetwork->isValid() && (newMode != oldMode)){
        if (newMode != Dock::FashionMode) {
            removeItem(COMPLEX_NETWORK_PLUGIN_ID);
        }
        else {
            onEnabledChanged();
        }
    }
}

QString ComplexPlugin::getMenuContent(QString)
{
    return "";
}

void ComplexPlugin::invokeMenuItem(QString, QString, bool)
{

}

void ComplexPlugin::initSettings()
{
    m_settings = new QSettings("deepin", "dde-dock-network-complex-plugin", this);
}

void ComplexPlugin::addNewItem(const QString &id)
{
    if (m_complexItem != nullptr)
        return;

    m_complexItem = new ComplexItem(m_dbusNetwork);
    m_proxy->itemAddedEvent(id);

    //add setting line to dock plugins setting frame
    m_proxy->infoChangedEvent(DockPluginInterface::InfoTypeConfigurable, id);
    //update setting state
    m_proxy->infoChangedEvent(DockPluginInterface::InfoTypeEnable, id);
    m_proxy->infoChangedEvent(DockPluginInterface::InfoTypeTitle, id);
}

void ComplexPlugin::removeItem(const QString &id)
{
    if (m_complexItem != nullptr) {
        m_complexItem->setVisible(false);
        m_proxy->itemRemovedEvent(id);
        m_complexItem->deleteLater();
        m_complexItem = nullptr;
        m_proxy->infoChangedEvent(DockPluginInterface::InfoTypeConfigurable, id);
    }

    if (m_applet != nullptr) {
        m_applet->deleteLater();
        m_applet = nullptr;
    }
}

void ComplexPlugin::onEnabledChanged()
{
    if (!m_proxy)
        return;

    if (m_complexItem != nullptr) {
        m_complexItem->setVisible(false);
        removeItem(COMPLEX_NETWORK_PLUGIN_ID);
    }
    if (enabled(COMPLEX_NETWORK_PLUGIN_ID)) {
        addNewItem(COMPLEX_NETWORK_PLUGIN_ID);
    }
    else {
        m_proxy->infoChangedEvent(DockPluginInterface::InfoTypeConfigurable, COMPLEX_NETWORK_PLUGIN_ID);
    }
}

QString ComplexPlugin::settingEnabledKey(const QString &id)
{
    return QString::number(m_mode) + QString("/%1_enabled").arg(id);
}
