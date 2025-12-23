# Qt 6 QML 动画组件完整实战指南

本指南系统覆盖 Qt 6 / Qt Quick 中所有常用动画组件，偏实战示例，可直接复制使用。

## 目录
1. 基础动画
2. 高性能 Animator
3. 组合动画
4. 状态与行为动画
5. 路径动画
6. 控制与缓动

---

## 一、基础动画

### PropertyAnimation（通用属性动画）
```qml
PropertyAnimation {
    target: rect
    property: "x"
    from: 0
    to: 200
    duration: 300
}
```

### NumberAnimation（数值动画，最常用）
```qml
NumberAnimation {
    target: rect
    property: "opacity"
    from: 0
    to: 1
    duration: 400
}
```

### ColorAnimation（颜色过渡）
```qml
ColorAnimation {
    target: rect
    property: "color"
    from: "red"
    to: "#3498db"
    duration: 300
}
```

### RotationAnimation（旋转动画）
```qml
RotationAnimation {
    target: icon
    from: 0
    to: 360
    duration: 800
    loops: Animation.Infinite
}
```

### Vector3dAnimation（3D 向量动画）
```qml
Vector3dAnimation {
    property: "scale"
    from: Qt.vector3d(1,1,1)
    to: Qt.vector3d(1.2,1.2,1)
}
```

---

## 二、高性能 Animator

### OpacityAnimator（透明度）
```qml
OpacityAnimator {
    target: rect
    from: 0
    to: 1
    duration: 200
}
```

### ScaleAnimator（缩放动画）
```qml
ScaleAnimator {
    target: rect
    from: 1
    to: 0.9
    duration: 150
}
```

### RotationAnimator（旋转动画）
```qml
RotationAnimator {
    target: spinner
    from: 0
    to: 360
    duration: 1000
    loops: Animation.Infinite
}
```

### XAnimator / YAnimator（位移动画）
```qml
XAnimator {
    target: page
    to: 0
    duration: 300
}
```

### UniformAnimator（Shader 动画）
```qml
UniformAnimator {
    target: shaderEffect
    uniform: "u_progress"
    from: 0
    to: 1
}
```

---

## 三、组合动画

### SequentialAnimation（顺序动画）
```qml
SequentialAnimation {
    NumberAnimation { property: "x"; to: 200 }
    PauseAnimation { duration: 200 }
    NumberAnimation { property: "x"; to: 0 }
}
```

### ParallelAnimation（并行动画）
```qml
ParallelAnimation {
    XAnimator { to: 200; duration: 300 }
    OpacityAnimator { to: 0.5; duration: 300 }
}
```

---

## 四、状态与行为动画

### Behavior（属性变化自动动画）
```qml
Behavior on width {
    NumberAnimation { duration: 300 }
}
```

### Transition（状态切换动画）
```qml
Transition {
    ParallelAnimation {
        XAnimator { duration: 300 }
        OpacityAnimator { duration: 300 }
    }
}
```

---

## 五、路径动画

### PathAnimation（沿路径运动）
```qml
PathAnimation {
    target: ball
    duration: 1000
    path: Path {
        startX: 0; startY: 0
        PathCubic {
            x: 300; y: 0
            control1X: 100; control1Y: 200
            control2X: 200; control2Y: -200
        }
    }
}
```

---

## 六、控制与缓动

### PauseAnimation（动画延时）
```qml
PauseAnimation { duration: 300 }
```

### ScriptAction（执行脚本）
```qml
ScriptAction {
    script: console.log("动画完成")
}
```

### Easing（缓动函数示例）
```qml
NumberAnimation {
    to: 200
    easing.type: Easing.OutBounce
}
```

---

**实战建议：**

- UI 动画：优先使用 Animator / Behavior + Easing，保证 60FPS
- 逻辑动画：使用 NumberAnimation + State / Transition
- 路径动画：PathAnimation 可组合多段 PathLine / PathCubic / PathQuad
- 循环动画：设置 loops: Animation.Infinite 或 ParallelAnimation + RotationAnimator

