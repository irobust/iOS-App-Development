# สร้าง Navigation
เราจะเริ่มจากการสร้างหน้า Chart View ก่อน

## สร้างหน้า ChartView(เฉพาะส่วนของ Chart)
1. สร้าง View ใหม่ชื่อว่า ChartView.swift
1. เราจะทำการเปลี่ยนให้ Application นี้ไปเริ่มที่ ChartView ก่อนโดยไปเปลี่ยน View เริ่มต้นที่ไฟล์ QuickCardApp.swift
    ```
    @main
    struct demoApp: App {
        var body: some Scene {
            WindowGroup {
                ChartView()
            }
        }
    }
    ```
### สร้าง Chart
1. สร้าง Chart แบบ fix Width และ fix height ด้วย Rectangle()
    ```
    HStack(alignment: .bottom, spacing: 5) {
        Rectangle()
            .fill(Color.green)
            .frame(width: 60, height: 70)
        Rectangle()
            .fill(Color.green)
            .frame(width: 60, height: 50)
        Rectangle()
            .fill(Color.green)
            .frame(width: 60, height: 30)
        Rectangle()
            .fill(Color.green)
            .frame(width: 60, height: 80)
        Rectangle()
            .fill(Color.green)
            .frame(width: 60, height: 90)
            
    }.frame(width: 100, height: 200)
    ```
1. เปลี่ยนมาคำนวนความกว้างตามขนาดของหน้าจอโดยใช้ GeometryReader
    ```
    GeometryReader{ proxy in
        HStack(alignment: .bottom, spacing: 5) {
            Rectangle()
                .fill(Color.green)
                .frame(width: proxy.size.width / 5, height: 70)
            Rectangle()
                .fill(Color.green)
                .frame(width: proxy.size.width / 5, height: 50)
            Rectangle()
                .fill(Color.green)
                .frame(width: proxy.size.width / 5, height: 30)
            Rectangle()
                .fill(Color.green)
                .frame(width: proxy.size.width / 5, height: 80)
            Rectangle()
                .fill(Color.green)
                .frame(width: proxy.size.width / 5, height: 90)
        }
    }
    ```
1. สร้างไฟล์ CardDetail.swift เพื่อใช้แสดง BusinessCard และ ChartView ในหน้านี้
1. เปลี่ยนหน้าเริ่มต้นให้เป็น CardDetail (QuickCardApp.swift)
    ```
    @main
    struct demoApp: App {
        var body: some Scene {
            WindowGroup {
                CardDetail()
            }
        }
    }
    ```
1. เอา Detail ของ Card มาแสดงผล โดยเราจะนำ BusinessCard มา re-use ในหน้านี้อีกครั้ง
    ```
    VStack{
        BusinessCard(opacity: .constant(1.0))
        Spacer()
        ChartView().frame(width: 300)
    }.frame(height: 400)
    ```
## สร้าง Navigation จากหน้าแรก(ContentView) มายังหน้าที่ 2(CardDetail)
1. เปลี่ยนให้หน้าแรกกลับไปเป็น ContentView เหมือนเดิม (QuickCardApp.swift)
    ```
    @main
    struct demoApp: App {
        var body: some Scene {
            WindowGroup {
                ContentView()
            }
        }
    }
    ```
1. ในหน้า Content View ให้ครอบด้วย NavigationView

    ```
    NavigationView {
        ScrollView(.horizontal, showsIndicators: false){
            ....
        }
    }
    ```
1. ตรงไหนที่ต้องการให้กด Link ได้ให้ใช้ NavigatorLink
    ```
    ForEach(data, id:\.self){ item in
        NavigationLink(destination: CardDetail()) {
            BusinessCard()
        }
    }
    ```

ดูเรื่อง [Model](Model.md) ต่อ