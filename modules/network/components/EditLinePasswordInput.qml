import QtQuick 2.1
import Deepin.Widgets 1.0

BaseEditLine {
    id: root
    
    property int echoMode
    
    rightLoader.sourceComponent: DTextInput{
        width: valueWidth
        // echoMode: root.echoMode
        echoMode: TextInput.Password
        // TODO fix property loop binding
        Binding on text {
            when: root.value != undefined
            value: root.value
        }
        onTextChanged: {
            root.value = text
            setKey()
        }
    }
    
}

