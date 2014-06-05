// This file is automatically generated, please don't edit manually.
import QtQuick 2.1
import Deepin.Widgets 1.0
import "../edit"

BaseEditSection { 
    id: sectionVpn
    virtualSection: "vs-vpn"
    
    header.sourceComponent: EditDownArrowHeader{
        text: dsTr("VPN")
    }

    content.sourceComponent: Column { 
        EditLineComboBox {
            id: lineVsVpnVkVpnType
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "vs-vpn"
            key: "vk-vpn-type"
            text: dsTr("VPN Type")
        }
        EditLineTextInput {
            id: lineAliasVpnL2tpGateway
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-l2tp"
            key: "gateway"
            text: dsTr("Gateway")
        }
        EditLineTextInput {
            id: lineAliasVpnL2tpUser
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-l2tp"
            key: "user"
            text: dsTr("Username")
        }
        EditLineComboBox {
            id: lineAliasVpnL2tpPasswordFlags
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-l2tp"
            key: "password-flags"
            text: dsTr("Ask for Pwd")
        }
        EditLinePasswordInput {
            id: lineAliasVpnL2tpPassword
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-l2tp"
            key: "password"
            text: dsTr("Password")
        }
        EditLineTextInput {
            id: lineAliasVpnL2tpDomain
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-l2tp"
            key: "domain"
            text: dsTr("Domain")
        }
        EditLineTextInput {
            id: lineAliasVpnOpenconnectGateway
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openconnect"
            key: "gateway"
            text: dsTr("Gateway")
        }
        EditLineFileChooser {
            id: lineAliasVpnOpenconnectCacert
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openconnect"
            key: "cacert"
            text: dsTr("CA Cert")
        }
        EditLineTextInput {
            id: lineAliasVpnOpenconnectProxy
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openconnect"
            key: "proxy"
            text: dsTr("Proxy")
        }
        EditLineSwitchButton {
            id: lineAliasVpnOpenconnectEnableCsdTrojan
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openconnect"
            key: "enable_csd_trojan"
            text: dsTr("Allow Cisco Secure Desktop Trojan")
        }
        EditLineTextInput {
            id: lineAliasVpnOpenconnectCsdWrapper
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openconnect"
            key: "csd_wrapper"
            text: dsTr("CSD Wrapper")
        }
        EditLineFileChooser {
            id: lineAliasVpnOpenconnectUsercert
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openconnect"
            key: "usercert"
            text: dsTr("Uesr Cert")
        }
        EditLineFileChooser {
            id: lineAliasVpnOpenconnectUserkey
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openconnect"
            key: "userkey"
            text: dsTr("Private Key")
        }
        EditLineSwitchButton {
            id: lineAliasVpnOpenconnectPemPassphraseFsid
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openconnect"
            key: "pem_passphrase_fsid"
            text: dsTr("User FSID For Key Passphrase")
        }
        EditLineTextInput {
            id: lineAliasVpnOpenvpnRemote
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "remote"
            text: dsTr("Gateway")
        }
        EditLineComboBox {
            id: lineAliasVpnOpenvpnConnectionType
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "connection-type"
            text: dsTr("Auth Type")
        }
        EditLineTextInput {
            id: lineAliasVpnOpenvpnUsername
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "username"
            text: dsTr("Username")
        }
        EditLineComboBox {
            id: lineAliasVpnOpenvpnPasswordFlags
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "password-flags"
            text: dsTr("Ask for Pwd")
        }
        EditLinePasswordInput {
            id: lineAliasVpnOpenvpnPassword
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "password"
            text: dsTr("Password")
        }
        EditLineFileChooser {
            id: lineAliasVpnOpenvpnCert
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "cert"
            text: dsTr("User Cert")
        }
        EditLineFileChooser {
            id: lineAliasVpnOpenvpnCa
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "ca"
            text: dsTr("CA Cert")
        }
        EditLineFileChooser {
            id: lineAliasVpnOpenvpnKey
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "key"
            text: dsTr("Private Key")
        }
        EditLineComboBox {
            id: lineAliasVpnOpenvpnCertPassFlags
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "cert-pass-flags"
            text: dsTr("Ask for Pwd")
        }
        EditLinePasswordInput {
            id: lineAliasVpnOpenvpnCertPass
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "cert-pass"
            text: dsTr("Private Pwd")
        }
        EditLineFileChooser {
            id: lineAliasVpnOpenvpnStaticKey
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "static-key"
            text: dsTr("Static Key")
        }
        EditLineSwitchButton {
            id: lineAliasVpnOpenvpnVkStaticKeyDirection
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "vk-static-key-direction"
            text: dsTr("Use Key Direction")
        }
        EditLineComboBox {
            id: lineAliasVpnOpenvpnStaticKeyDirection
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "static-key-direction"
            text: dsTr("Key Direction")
        }
        EditLineTextInput {
            id: lineAliasVpnOpenvpnRemoteIp
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "remote-ip"
            text: dsTr("Remote IP")
        }
        EditLineTextInput {
            id: lineAliasVpnOpenvpnLocalIp
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-openvpn"
            key: "local-ip"
            text: dsTr("Local IP")
        }
        EditLineTextInput {
            id: lineAliasVpnPptpGateway
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-pptp"
            key: "gateway"
            text: dsTr("Gateway")
        }
        EditLineTextInput {
            id: lineAliasVpnPptpUser
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-pptp"
            key: "user"
            text: dsTr("Username")
        }
        EditLineComboBox {
            id: lineAliasVpnPptpPasswordFlags
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-pptp"
            key: "password-flags"
            text: dsTr("Ask for Pwd")
        }
        EditLinePasswordInput {
            id: lineAliasVpnPptpPassword
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-pptp"
            key: "password"
            text: dsTr("Password")
        }
        EditLineTextInput {
            id: lineAliasVpnPptpDomain
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-pptp"
            key: "domain"
            text: dsTr("Domain")
        }
        EditLineTextInput {
            id: lineAliasVpnVpncIpsecGateway
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-vpnc"
            key: "IPSec gateway"
            text: dsTr("Gateway")
        }
        EditLineTextInput {
            id: lineAliasVpnVpncXauthUsername
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-vpnc"
            key: "Xauth username"
            text: dsTr("Username")
        }
        EditLineComboBox {
            id: lineAliasVpnVpncXauthPasswordFlags
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-vpnc"
            key: "Xauth password-flags"
            text: dsTr("Ask for Pwd")
        }
        EditLinePasswordInput {
            id: lineAliasVpnVpncXauthPassword
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-vpnc"
            key: "Xauth password"
            text: dsTr("User Pwd")
        }
        EditLineTextInput {
            id: lineAliasVpnVpncIpsecId
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-vpnc"
            key: "IPSec ID"
            text: dsTr("Group Name")
        }
        EditLineComboBox {
            id: lineAliasVpnVpncIpsecSecretFlags
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-vpnc"
            key: "IPSec secret-flags"
            text: dsTr("Ask for Pwd")
        }
        EditLinePasswordInput {
            id: lineAliasVpnVpncIpsecSecret
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-vpnc"
            key: "IPSec secret"
            text: dsTr("Group Pwd")
        }
        EditLineSwitchButton {
            id: lineAliasVpnVpncVkHybridAuthmode
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-vpnc"
            key: "vk-hybrid-authmode"
            text: dsTr("Use Hybrid Authentication")
        }
        EditLineFileChooser {
            id: lineAliasVpnVpncCaFile
            connectionSession: sectionVpn.connectionSession
            availableSections: sectionVpn.availableSections
            availableKeys: sectionVpn.availableKeys
            connectionData: sectionVpn.connectionData
            errors: sectionVpn.errors
            section: "alias-vpn-vpnc"
            key: "CA-File"
            text: dsTr("CA File")
        }
    }
}
