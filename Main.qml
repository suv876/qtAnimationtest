import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // Rectangle {
    //     id: root
    //     width: 150
    //     height: 400
    //     anchors.right: parent.right

    //     // 自定义属性 property <type> <name>: <value>
    //     property color black:  "#1f1f21"
    //     property color red:    "#ff3d39"
    //     property color green:  "#53d769"
    //     property color yellow: "#ffff37"

    //     // 背景渐变
    //     gradient: Gradient {
    //         GradientStop { position: 0.0; color: "#2ed5fa" }
    //         GradientStop { position: 1.0; color: "#2467ec" }
    //     }

    //     Rectangle {
    //         id: light1
    //         x: 25
    //         y: 15
    //         width: 100
    //         height: width
    //         radius: width / 2
    //         color: root.black
    //         border.color: Qt.lighter(color, 1.1)
    //     }

    //     Rectangle {
    //         id: light2
    //         x: 25
    //         y: 135
    //         width: 100
    //         height: width
    //         radius: width / 2
    //         color: root.black
    //         border.color: Qt.lighter(color, 1.1)
    //     }

    //     Rectangle {
    //         id: light3
    //         x: 25
    //         y: 255
    //         width: 100
    //         height: width
    //         radius: width / 2
    //         color: root.black
    //         border.color: Qt.lighter(color, 1.1)
    //     }

    //     // 默认状态为 "stop"
    //     state: "stop"

    //     states: [
    //         State {
    //             name: "stop"
    //             PropertyChanges { target: light1; color: root.red }
    //             PropertyChanges { target: light2; color: root.black }
    //         },
    //         State {
    //             name: "go"
    //             PropertyChanges { target: light1; color: root.black }
    //             PropertyChanges { target: light2; color: root.green }
    //         },
    //         State {
    //             name: "wait"
    //             PropertyChanges { target: light1; color: root.black }
    //             PropertyChanges { target: light2; color: root.black }
    //             PropertyChanges { target: light3; color: root.yellow }
    //         }
    //     ]

    //     // 整个矩形区域响应点击
    //     MouseArea {
    //         anchors.fill: parent
    //         onClicked: {
    //             if (parent.state === "stop")
    //                 parent.state = "wait"
    //             else if (parent.state === "wait")
    //                 parent.state = "go"
    //             else
    //                 parent.state = "stop"
    //         }
    //     }

    //     // 状态切换动画
    //     transitions: [
    //         Transition {
    //             from: "stop"
    //             to: "wait"
    //             ColorAnimation {
    //                 target: light1
    //                 properties: "color"
    //                 duration: 2000
    //             }
    //             ColorAnimation {
    //                 target: light3
    //                 properties: "color"
    //                 duration: 2000
    //             }
    //         },
    //         Transition {
    //             from: "wait"
    //             to: "go"
    //             ColorAnimation {
    //                 target: light2
    //                 properties: "color"
    //                 duration: 2000
    //             }
    //             ColorAnimation {
    //                 target: light3
    //                 properties: "color"
    //                 duration: 2000
    //             }
    //         }
    //     ]
    // }

    Button{
        id: idBtn1
        width: 20
        height: 20
        x: 10
        y:10
        property alias color: idBack.color
        Rectangle{
            id: idBack
            anchors.fill: parent
            color: "green"
        }

        onClicked: {
            paraAni.start()
        }
        ParallelAnimation  {
            id: paraAni
            loops: Animation.Infinite
            PropertyAnimation {
                id: idProAni_h
                target: idBtn1
                property: "height"
                from: 50
                to: 150
                duration: 10000
            }
            //PauseAnimation { duration: 5000 }
            PropertyAnimation {
                id: idProAni_w
                target: idBtn1
                property: "width"
                from: 50
                to: 150
                duration: 10000
            }
            PropertyAnimation {
                id: idProAni_x
                target: idBtn1
                property: "x"
                from: 10
                to: 200
                duration: 10000
            }
            PropertyAnimation {
                id: idProAni_y
                target: idBtn1
                property: "y"
                from: 10
                to: 200
                duration: 10000
            }

            // PathAnimation {
            //     target: idBtn1
            //     duration: 10000
            //     loops: Animation.Infinite
            //     path: Path {
            //         startX: 50; startY: 50

            //         // 直线段
            //         PathLine { x: 200; y: 50 }

            //         // 二次贝塞尔
            //         PathQuad { x: 300; y: 150; controlX: 250; controlY: 0 }

            //         // 三次贝塞尔
            //         PathCubic {
            //             x: 100; y: 300
            //             control1X: 350; control1Y: 200
            //             control2X: 50; control2Y: 350
            //         }

            //         // 圆弧
            //         PathArc {
            //             x: 50; y: 50
            //             radiusX: 100; radiusY: 100
            //             useLargeArc: true
            //             //sweep: true
            //         }
            //     }
            //     easing.type: Easing.InOutBounce
            // }
            // XAnimator{
            //     target: idBtn1
            //     to: 200
            //     duration: 10000
            // }
            // YAnimator{
            //     target: idBtn1
            //     to:200
            //     duration: 10000
            // }
            NumberAnimation {
                id: idNumAni
                target: idBtn1
                property: "text"
                from: 0
                to: 10
                duration: 10000
            }
            ColorAnimation {
                id: idColAni
                target: idBtn1
                property: "color"
                from: "red"
                to: "#3498db"
                duration: 10000
            }
            RotationAnimation {
                id: idRotAni
                target: idBtn1
                from: 0
                to: 360
                duration: 10000
                loops: 1/*Animation.Infinite*/
            }
            OpacityAnimator {
                id: idOpaAni
                target: idBtn1
                from: 0
                to: 1
                duration: 10000
            }
            // ScaleAnimator {
            //     id: idScaAni
            //     target: idBtn1
            //     from: 1
            //     to: 10
            //     duration: 10000
            // }
        }
    }
}
