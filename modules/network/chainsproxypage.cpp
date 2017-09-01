#include "chainsproxypage.h"
#include "nextpagewidget.h"
#include "lineeditwidget.h"
#include "settingsgroup.h"
#include "translucentframe.h"
#include "buttontuple.h"

#include <QHBoxLayout>
#include <QLabel>

using namespace dcc;
using namespace dcc::network;
using namespace dcc::widgets;

ChainsProxyPage::ChainsProxyPage(QWidget *parent) : ContentWidget(parent)
{
    m_proxyType = new NextPageWidget;
    m_proxyType->setTitle(tr("Proxy Type"));

    m_addr = new LineEditWidget;
    m_addr->setTitle(tr("IP address"));
    m_addr->setPlaceholderText(tr("Required"));

    m_port = new LineEditWidget;
    m_port->setTitle(tr("Port"));
    m_port->setPlaceholderText(tr("Required"));

    m_username = new LineEditWidget;
    m_username->setTitle(tr("Username"));
    m_username->setPlaceholderText(tr("Optional"));

    m_password = new LineEditWidget;
    m_password->setTitle(tr("Password"));
    m_password->setPlaceholderText(tr("Optional"));

    SettingsGroup *grp = new SettingsGroup;
    grp->appendItem(m_proxyType);
    grp->appendItem(m_addr);
    grp->appendItem(m_port);
    grp->appendItem(m_username);
    grp->appendItem(m_password);

    QVBoxLayout *layout = new QVBoxLayout;
    layout->setMargin(0);
    layout->setSpacing(10);

    layout->addSpacing(20);
    layout->addWidget(grp);

    QLabel *tip = new QLabel;
    tip->setText(tr("Check \"Open by proxy\" of application context menu in Laucher to use after configured"));
    tip->setWordWrap(true);
    layout->addWidget(tip);

    ButtonTuple *btns = new ButtonTuple;
    btns->leftButton()->setText(tr("Cancel"));
    btns->rightButton()->setText(tr("OK"));

    layout->addWidget(btns);

    layout->addStretch();

    TranslucentFrame *w = new TranslucentFrame;
    w->setLayout(layout);

    setContent(w);

    connect(btns->leftButton(), &QPushButton::clicked, this, &ChainsProxyPage::back);
    connect(btns->rightButton(), &QPushButton::clicked, this, &ChainsProxyPage::onCheckValue);
}

void ChainsProxyPage::setModel(NetworkModel *model)
{
    m_model = model;

    connect(model, &NetworkModel::chainsTypeChanged, m_proxyType, &NextPageWidget::setValue);
    connect(model, &NetworkModel::chainsAddrChanged, m_addr, &LineEditWidget::setText);
    connect(model, &NetworkModel::chainsPortChanged, m_port, &LineEditWidget::setText);
    connect(model, &NetworkModel::chainsUsernameChanged, m_username, &LineEditWidget::setText);
    connect(model, &NetworkModel::chainsPasswdChanged, m_password, &LineEditWidget::setText);

    ProxyConfig config = model->getChainsProxy();

    m_proxyType->setValue(config.type);
    m_addr->setText(config.url);
    m_port->setText(config.port);
    m_username->setText(config.username);
    m_password->setText(config.password);
}

void ChainsProxyPage::onCheckValue()
{
    m_addr->setIsErr(false);
    m_port->setIsErr(false);
    m_username->setIsErr(false);
    m_password->setIsErr(false);

    const QString &addr = m_addr->text();
    if (addr.isEmpty()) {
        m_addr->setIsErr();
        return;
    }

    const QString &port = m_port->text();
    if (port.isEmpty()) {
        m_port->setIsErr();
        return;
    }

    const QString &username = m_username->text();
    const QString &password = m_password->text();

    if (!((username.isEmpty() && password.isEmpty()) || (!username.isEmpty() && !password.isEmpty()))) {
        m_username->setIsErr();
        m_password->setIsErr();
        return;
    }

    ProxyConfig config;
    config.type = m_proxyType->value();
    config.url = addr;
    config.port = port;
    config.username = username;
    config.password = password;

    emit requestSet(config);
}
