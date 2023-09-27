# Animation and Gesture
## สร้าง Animation ให้กับ UI
1. สร้างตัวแปร @State สำหรับการเปลี่ยนแปลง UI ก่อน(Animation จะทำงานเมื่อมีการเปลี่ยนแปลง UI) โดยเข้าไปที่ CardDetail.swift แล้วเพิ่มตัวแปร
    ```
    @State var isChartVisible = true
    ```
1. ซ่อนการแสดงผล Chart ไว้ก่อน
    ```
    if isChartVisible {
        ChartView().frame(width: 300)
    }
    ```
1. เพิ่ม Event Tap เข้าไปใน BusinessCard(Tap ที่ BusinessCard แล้ว Chart จะโผล่ขึ้นมา)
    ```
    BusinessCard(opacity: .constant(1.0), user: user)
    .onTapGesture {
        withAnimation(.easeIn, {
            self.isChartVisible.toggle()
        })
    }
    ```
    หรือจะนับจำนวน Tap
    ```
    ```
    BusinessCard(opacity: .constant(1.0), user: user)
    .onTapGesture(count: 2) {
        withAnimation(.easeIn, {
            self.isChartVisible.toggle()
        })
    }
    ```
    ```
1. ลองเปลี่ยนจาก TapGesture ไปเป็น LongPressGesture
    ```
    BusinessCard(opacity: .constant(1.0), user: user)
    .onLongPressGesture {
        withAnimation(.easeIn, {
            self.isChartVisible.toggle()
        })
    }
    ```
1. เราสามารถกำหนด Animation ใน Stack แบบนี้ก็ได้
    ```
    ZStack{
        
        ...

        .scaleEffect(isChartLoaded ? 1.2 : 1.0)
        .animation(.easeOut, value: isChartLoaded)
    }
    ```

    ```
    BusinessCard(opacity: .constant(1.0), user: user)
    .onTapGesture {
        self.isChartVisible.toggle()
    }
    ```
1. กำหนด Transition ให้ ChartView วิ่งขึ้นมาจากด้านล่าง
    ```
    ChartView()
        .frame(width: 300)
        .transition(.move(edge: .bottom))
    ```
### ใช้งาน Event onAppear และ onDisAppear
1. เราเพิ่ม @State เพื่อเก็บว่า Chart นั้น Load ขึ้นมาแล้วรึยัง เพื่อจะนำไป toggle icon ใน Business Card
    ```
    @State var isChartLoaded = false
    ```
1. เพิ่ม Event onAppear เข้าไปใน ChartView
    ```
    .onAppear {
        isChartLoaded = true
    }
    ```
1. เพิ่ม Event onDisAppear เข้าไปใน ChartView
    ```
    .onDisappear {
        isChartLoaded = false
    }
    ```
1. สร้างตัวแปรใน BusinessCard.swift
    ```
    var isChartLoaded: Bool = false
    ```
1. ส่งค่า isChartLoaded เข้าไปใน BusinessCard (อยู่ในไฟล์ CardDetail.swift)
    ```
    BusinessCard(opacity: .constant(1.0), user: user, isChartLoaded: isChartLoaded)
                .gesture(....)
    ```
1. ใส่ if block ใน BusinessCard เพื่อ Toggle image
    ```
    if isChartLoaded {
        Image(systemName: "arrow.up.square")
    }else{
        Image(systemName: "arrow.down.app")
    }
    ```

## สร้าง Animation ให้ ChartView
1. เริ่มจากการใส่ Label ให้กับ bar chart ด้วยการเพิ่ม property text เข้าไป
    ```
    var text: String
    ```

1. แก้ไข Content Preview ให้รับ text เข้ามาแสดงผล
    ```
    BarView(size: CGSize(width: 50, height: 200), value: 30, text: "Delay Days")
    ```
1. ครอบ Rectangle() ด้วย VStack
    ```
    VStack{
        Rectangle()
            .fill(Color.green)
            .frame(width: size.width / 5
                    , height: size.height * CGFloat(value) / 100)
    }
    ```
1. เพิ่ม Text() เข้าไปโดยเพิ่ม RotationEffect เข้าไปเพื่ิอให้ตัว Text นั้นแสดงผลในแนวตั้ง
    ```
    VStack{
        Rectangle()
            ...
        Text(text)
            .font(.footnote)
            .rotationEffect(.degrees(-80))
            .offset(y: 20)
            .padding(.top)
    }
    ```
    rotationEffect เป็นการปรับตำแหน่งการแสดงผล ส่วน offset จะขยับตำแหน่งในแนวแกน x และ แกน y ในตัวอย่างนี้เรากำหนด y = 20 จะเป็นการขยับลงมา

    ดูเรื่อง [Persistance](Persistance.md) ต่อ