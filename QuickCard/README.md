# สร้าง iOS Application ด้วย SwiftUI
## การจัดการ Layout เบื้องต้น
### HStack จัดเรียง Layout ในแนวนอน
```
HStack {
    Image(systemName: "envelope.fill")
        .foregroundColor(.orange)
    Text("john@example.com")
}
```

### VStack จัดเรียง Layout ในแนวตั้ง
```
VStack(alignment: .leading) {
    Text("John Doe")
        .font(.title)
    Text("Software Engineer")
        .italic()
    HStack {
        Image(systemName: "envelope.fill")
            .foregroundColor(.orange)
        Text("john@example.com")
    }
    HStack {
        Image(systemName: "link")
            .foregroundColor(.orange)
        Text("example.com")
    }
    HStack {
        Image(systemName: "location.fill")
            .foregroundColor(.orange)
        Text("123 Example Address")
    }
}
```

### ZStack วาง UI ซ้อนกัน
1. เพิ่ม Color Set ใน Asset
    * เลือก __Asset__ ที่ Project Navigator
    * กด "__+__" เพื่อเพิ่ม __Color Set__ 
    * ตั้งชื่อ Color Set เป็น "__PrimaryColor__"

1. เพิ่ม Background 
```
    ZStack {
            Rectangle()
                .fill(Color("PrimaryColor"))
                .frame(width: 300, height: 200)
                .cornerRadius(20)
                .shadow(radius: 10)
            VStack(alignment: .leading) {
                ....
            }.foregroundColor(.white)
        }
```

## เปลี่ยน Image ที่อยู่หน้า Text ให้เป็น SubView
1. สร้างไฟล์ใหม่ ชื่อ ImageView.swift
1. ย้าย Image และ Text ไปไว้ใน ImageView.swift
    ```
    HStack {
        Image(systemName: imageName)
        .foregroundColor(.orange)
        Text(text)
    }
    ```
1. เพิ่ม ตัวแปร 2 ตัวคือ ชื่อ Image และ Text
    ```
    struct ImageView: View {
        var imageName: String
        var text: String
        var body: some View {
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(.orange)
                Text(text)
            }
        }
    }
    ```
1. เปลี่ยน HStack ใน ContentView ไปเป็น ImageView
    ```
    ZStack {
        Rectangle()
            .fill(Color("PrimaryColor"))
            .frame(width: 300, height: 200)
            .cornerRadius(20)
            .shadow(radius: 10)
        VStack(alignment: .leading) {
            Text("John Doe")
                .font(.title)
            Text("Software Engineer")
                .italic()

            // เปลี่ยนจาก HStack เป็น ImageView
            ImageView(imageName: "envelope.fill", text: "john@example.com")
            ImageView(imageName: "link", text: "example.com")
            ImageView(imageName: "location.fill", text: "123 Example Address")

        }.foregroundColor(.white)
    }
    ```
1. ในไฟล์ ImageView จะมี Error ที่ตัว Preview เนื่องจากเราสร้าง properties เข้ามา 2 ตัวคือ imageName และ text ดังนั้นเราเลยต้องใส่ arguments 2 ตัวนี้เข้ามาด้วย (เราใช้ struct ในการสร้าง View เลยต้องใช้ default constructor)
    ```
    struct ImageLabelView_Previews: PreviewProvider {
        static var previews: some View {
        ImageLabelView(imageName: "envelope.fill",
                        text: .constant("mobileunder10@gmail.com"))
            .previewLayout(.sizeThatFits)
        }
    }
    ```
## ForEach เพื่อสร้าง Business Card หลายๆกล่อง
1. ย้ายทั้งหมดออกไปเป็น Business Card เพื่อที่จะได้ reuse ใช้ได้ง่ายๆ
    * สร้างไฟล์ใหม่ชื่อ BusinessCard.swift
    * ย้าย ZStack ใน Content View ไปไว้ใน BusinessCard.swift
        ```
        ZStack {
            ....
        }
        ```
    * ใน ContentView เราก็แค่เรียกใช้ BusinessCard ขึ้นมา
        ```
        var body: some View {
            BusinessCard()
        }
        ```
1. เพิ่ม Loop เข้าไปเพื่อสร้าง Business Cards เพิ่ม (loop i ตั้งแต่ 1-10)
    ```
    let data = 1...10
    struct ContentView: View {
        var body: some View {
            ForEach(data, id: \.self){ i in
                BusinessCard()
            }
        }
    }
    ```
1. เมื่อ View ของเราล้นจอ จึงต้องครอบด้วย ScrollView เพื่อให้เราสามารถจะเลื่อนขึ้นหรือเลื่อนลงได้
    ```
    ScrollView( .vertical, showsIndicators: false ){
        VStack{
            ForEach(data, id: \.self){ i in
                BusinessCard()
            }
        }
    }
    ```

    ## รู้จักกับ @State
    1. เพิ่มตัวแปร State ขึ้นมา(เมื่อตัวแปรเปลี่ยนจะมีการ re-render หน้าจอใหม่)
        ```
        @State var value: Double = 0.5
        ```
    1. เพิ่ม Slider เข้ามาวางไว้ด้านบน
        ```
        HStack {
            Circle()
                .frame(width: 25)
                .foregroundColor(Color("PrimaryColor"))
            Slider(value: $value)
        }
        ```
        ถ้าต้องการให้ value นั้น read-only เราจะใช้ .constant() ครอบ
        ```
        HStack {
            Circle()
                .frame(width: 25)
                .foregroundColor(Color("PrimaryColor"))
            Slider(value: .constant(value))
        }
        ```

    1. หลังจากนั้น Content Preview จะ Error เราต้องกำหนดตัวแปร @State ให้ด้วย โดยที่ต้องกำหนดให้เป็น Static member
        ```
        struct ContentView_Previews: PreviewProvider {
            @State static var value = 0.5
            static var previews: some View {
                ContentView(value: value)
            }
        }
        ```
        กรณีที่ไม่ต้องการประกาศตัวแปร @State ขึ้นมาเราอาจใช้ .constant() ครอบแทนได้
        ```
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView(value: .constant(0.5))
            }
        }
        ```
    1. ทดสอบการแก้ไขค่าของตัวแปรจากใน Sub-View
        * ทำการเพิ่มปุ่ม reset เข้าไปใน BusinessCard
            ```
            VStack(alignment: .leading) {
                Text("John Doe").font(.title)
                
                ....

                Button(action: reset){
                    Label("Reset", systemImage: "clear.fill")
                }.padding(.top)
            }.foregroundColor(.white)
            ```
        * เพิ่ม function reset เข้าไปใน struct BusinessCard
            ```
            func reset(){
                opacity = 0.5
            }
            ```
ดูเรื่อง [Navigation](Navigation.md) ต่อ
