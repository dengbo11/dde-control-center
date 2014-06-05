// This file is automatically generated, please don't edit manually.
import QtQuick 2.1
import Deepin.Widgets 1.0
import "../edit"

BaseEditSection { 
    id: sectionVpnOpenvpnTlsauth
    virtualSection: "vs-vpn-openvpn-tlsauth"
    
    header.sourceComponent: EditDownArrowHeader{
        text: dsTr("VPN TLS Authentication")
    }

    content.sourceComponent: Column { 
        EditLineTextInput {
            id: lineAliasVpnOpenvpnTlsauthTlsRemote
            connectionSession: sectionVpnOpenvpnTlsauth.connectionSession
            availableSections: sectionVpnOpenvpnTlsauth.availableSections
            availableKeys: sectionVpnOpenvpnTlsauth.availableKeys
            connectionData: sectionVpnOpenvpnTlsauth.connectionData
            errors: sectionVpnOpenvpnTlsauth.errors
            section: "alias-vpn-openvpn-tlsauth"
            key: "tls-remote"
            text: dsTr("Subject Match")
        }
        EditLineComboBox {
            id: lineAliasVpnOpenvpnTlsauthRemoteCertTls
            connectionSession: sectionVpnOpenvpnTlsauth.connectionSession
            availableSections: sectionVpnOpenvpnTlsauth.availableSections
            availableKeys: sectionVpnOpenvpnTlsauth.availableKeys
            connectionData: sectionVpnOpenvpnTlsauth.connectionData
            errors: sectionVpnOpenvpnTlsauth.errors
            section: "alias-vpn-openvpn-tlsauth"
            key: "remote-cert-tls"
            text: dsTr("Remote Cert")
        }
        EditLineFileChooser {
            id: lineAliasVpnOpenvpnTlsauthTa
            connectionSession: sectionVpnOpenvpnTlsauth.connectionSession
            availableSections: sectionVpnOpenvpnTlsauth.availableSections
            availableKeys: sectionVpnOpenvpnTlsauth.availableKeys
            connectionData: sectionVpnOpenvpnTlsauth.connectionData
            errors: sectionVpnOpenvpnTlsauth.errors
            section: "alias-vpn-openvpn-tlsauth"
            key: "ta"
            text: dsTr("Key File")
        }
        EditLineSwitchButton {
            id: lineAliasVpnOpenvpnTlsauthVkTaDir
            connectionSession: sectionVpnOpenvpnTlsauth.connectionSession
            availableSections: sectionVpnOpenvpnTlsauth.availableSections
            availableKeys: sectionVpnOpenvpnTlsauth.availableKeys
            connectionData: sectionVpnOpenvpnTlsauth.connectionData
            errors: sectionVpnOpenvpnTlsauth.errors
            section: "alias-vpn-openvpn-tlsauth"
            key: "vk-ta-dir"
            text: dsTr("Use Key Direction")
        }
        EditLineComboBox {
            id: lineAliasVpnOpenvpnTlsauthTaDir
            connectionSession: sectionVpnOpenvpnTlsauth.connectionSession
            availableSections: sectionVpnOpenvpnTlsauth.availableSections
            availableKeys: sectionVpnOpenvpnTlsauth.availableKeys
            connectionData: sectionVpnOpenvpnTlsauth.connectionData
            errors: sectionVpnOpenvpnTlsauth.errors
            section: "alias-vpn-openvpn-tlsauth"
            key: "ta-dir"
            text: dsTr("Key Direction")
        }
    }
}
