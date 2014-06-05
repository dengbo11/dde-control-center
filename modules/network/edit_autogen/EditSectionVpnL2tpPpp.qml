// This file is automatically generated, please don't edit manually.
import QtQuick 2.1
import Deepin.Widgets 1.0
import "../edit"

BaseEditSection { 
    id: sectionVpnL2tpPpp
    virtualSection: "vs-vpn-l2tp-ppp"
    
    header.sourceComponent: EditDownArrowHeader{
        text: dsTr("VPN PPP")
    }

    content.sourceComponent: Column { 
        EditLineSwitchButton {
            id: lineAliasVpnL2tpPppVkRequireMppe
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "vk-require-mppe"
            text: dsTr("Use MPPE")
        }
        EditLineComboBox {
            id: lineAliasVpnL2tpPppVkMppeSecurity
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "vk-mppe-security"
            text: dsTr("Security")
        }
        EditLineSwitchButton {
            id: lineAliasVpnL2tpPppMppeStateful
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "mppe-stateful"
            text: dsTr("Stateful MPPE")
        }
        EditLineSwitchButton {
            id: lineAliasVpnL2tpPppRefuseEap
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "refuse-eap"
            text: dsTr("Refuse EAP Authentication")
            alwaysUpdate: true
        }
        EditLineSwitchButton {
            id: lineAliasVpnL2tpPppRefusePap
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "refuse-pap"
            text: dsTr("Refuse PAP Authentication")
            alwaysUpdate: true
        }
        EditLineSwitchButton {
            id: lineAliasVpnL2tpPppRefuseChap
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "refuse-chap"
            text: dsTr("Refuse CHAP Authentication")
            alwaysUpdate: true
        }
        EditLineSwitchButton {
            id: lineAliasVpnL2tpPppRefuseMschap
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "refuse-mschap"
            text: dsTr("Refuse MSCHAP Authentication")
            alwaysUpdate: true
        }
        EditLineSwitchButton {
            id: lineAliasVpnL2tpPppRefuseMschapv2
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "refuse-mschapv2"
            text: dsTr("Refuse MSCHAPv2 Authentication")
            alwaysUpdate: true
        }
        EditLineSwitchButton {
            id: lineAliasVpnL2tpPppNobsdcomp
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "nobsdcomp"
            text: dsTr("No BSD Data Compression")
        }
        EditLineSwitchButton {
            id: lineAliasVpnL2tpPppNodeflate
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "nodeflate"
            text: dsTr("No Deflate Data Compression")
        }
        EditLineSwitchButton {
            id: lineAliasVpnL2tpPppNoVjComp
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "no-vj-comp"
            text: dsTr("No TCP Header Compression")
        }
        EditLineSwitchButton {
            id: lineAliasVpnL2tpPppNopcomp
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "nopcomp"
            text: dsTr("No Protocol Field Compression")
        }
        EditLineSwitchButton {
            id: lineAliasVpnL2tpPppNoaccomp
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "noaccomp"
            text: dsTr("No Address/Control Compression")
        }
        EditLineSwitchButton {
            id: lineAliasVpnL2tpPppVkEnableLcpEcho
            connectionSession: sectionVpnL2tpPpp.connectionSession
            availableSections: sectionVpnL2tpPpp.availableSections
            availableKeys: sectionVpnL2tpPpp.availableKeys
            connectionData: sectionVpnL2tpPpp.connectionData
            errors: sectionVpnL2tpPpp.errors
            section: "alias-vpn-l2tp-ppp"
            key: "vk-enable-lcp-echo"
            text: dsTr("Send PPP Echo Packets")
        }
    }
}
