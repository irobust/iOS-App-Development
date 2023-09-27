# เริ่มต้นสร้าง Model
## สร้าง Model กันก่อน
1. สร้าง Group สำหรับเก็บ Model
1. สร้างไฟล์ User.swift โดยมีเนื้อหาดังนี้
    ```
    struct User: Identifiable {
        let id = UUID()
        var firstName: String
        var lastName: String
        var title: String
        var email: String
        var companyUrl: String
        var address: String
        
        var stat: Stat
    }

    extension User {
        static let users = [
            User(firstName: "Jonathan",
                lastName: "Wong",
                title: "Senior Software Engineer",
                email: "mobileunder10@gmail.com",
                companyUrl: "mobileunder10.com",
                address: "12345 Highland Road",
                stat: Stat(ordered: 50, completed: 60, satisfaction: 7, delayDays: 80, duration: 90)),
            User(firstName: "Nermal",
                lastName: "Vero",
                title: "Software Engineer",
                email: "nvero@yahoo.com",
                companyUrl: "vero123.com",
                address: "8822 Royal Road",
                stat: Stat(ordered: 10, completed: 20, satisfaction: 3, delayDays: 40, duration: 50)),
            User(firstName: "Evelyn",
                lastName: "Smith",
                title: "Business Analyst",
                email: "esmith@outlook.com",
                companyUrl: "esmithvet.com",
                address: "5544 Camino Del Sur",
                stat: Stat(ordered: 20, completed: 40, satisfaction: 6, delayDays: 80, duration: 100)),
            User(firstName: "Phoebe",
                lastName: "Lee",
                title: "Senior Business Analyst",
                email: "plee@gmail.com",
                companyUrl: "pleeproducts.com",
                address: "12345 Phaser Court",
                stat: Stat(ordered: 30, completed: 60, satisfaction: 3, delayDays: 65, duration: 35)),
            User(firstName: "Aaron",
                lastName: "Huang",
                title: "Mechanical Engineer",
                email: "ahuang@gmail.com",
                companyUrl: "ahrobots.com",
                address: "789 Robot Road",
                stat: Stat(ordered: 50, completed: 80, satisfaction: 9, delayDays: 10, duration: 10)),
            User(firstName: "Nathan",
                lastName: "Chan",
                title: "Product Engineer",
                email: "mobileunder10@gmail.com",
                companyUrl: "mobileunder10.com",
                address: "12345 Highland Road",
                stat: Stat(ordered: 10, completed: 20, satisfaction: 3, delayDays: 40, duration: 50)),
            User(firstName: "Avery",
                lastName: "Johnson",
                title: "Senior Software Engineer",
                email: "averyjohnson@outlook.com",
                companyUrl: "avpharm.com",
                address: "12121 Pathos Lane",
                stat: Stat(ordered: 30, completed: 60, satisfaction: 9, delayDays: 30, duration: 60)),
            User(firstName: "Harriet",
                lastName: "Brown",
                title: "Staff Software Engineer",
                email: "hbrown@yahoo.com",
                companyUrl: "catfurrr.com",
                address: "999 Cat Fur Lane",
                stat: Stat(ordered: 20, completed: 40, satisfaction: 6, delayDays: 80, duration: 90)),
            User(firstName: "Lillian",
                lastName: "Martin",
                title: "Software Engineer",
                email: "lmartinez@gmail.com",
                companyUrl: "sharksneversleep.com",
                address: "123 Under the Sea Lane",
                stat: Stat(ordered: 55, completed: 65, satisfaction: 7, delayDays: 85, duration: 95)),
            User(firstName: "Natalie",
                lastName: "Kim",
                title: "Software Manager",
                email: "nataliekim@yahoo.com",
                companyUrl: "natalite.com",
                address: "8888 Hidden Marker Road",
                stat: Stat(ordered: 15, completed: 25, satisfaction: 3, delayDays: 45, duration: 55)),
        ]
    }
    ```
1. สร้างไฟล์ Stat.swift ไว้ใน Model
    ```
    struct Stat: Identifiable {
        let id = UUID()
        var ordered: Int
        var completed: Int
        var satisfaction: Int
        var delayDays: Int
        var duration: Int
    }
    ```
1. Build ใหม่ซักครั้ง เพื่อให้แน่ใจว่า Model ของเราทำงานได้

## Binding Object user เข้าไปใน BusinessCard
1. เปลี่ยน loop ForEach ที่เราวน loop ตั้งแต่ 1-10 ไปเป็น ForEach Array ของ User.users แทน
    ```
    ForEach(User.users){ user in
        NavigationLink(destination: CardDetail(user: user)){
            BusinessCard(opacity: $value, user: user)
        }
    }
    ```
1. ใช้ตัวอย่าง User นี้ในการ preview ตรงไหนที่ error ให้ใส่ user นี้ลงไป
    ```
    User(firstName: "Natalie", lastName: "Kim", title: "Software Manager", email: "nataliekim@yahoo.com", companyUrl: "natalite.com", address: "8888 Hidden Marker Road", stat: Stat(ordered: 15, completed: 25, satisfaction: 3, delayDays: 45, duration: 55))
    ```
1. ใส่ตัวอย่าง user ลงใน Content_Preview หน้า BusinessCard และ CardDetail

1. Binding ค่าที่ได้จาก user ลงไปใน Text และ ImageView ที่ได้ Hard Code เป็น John Doe เอาไว้
    ```
    VStack(alignment: .leading) {
        Text("\(user.firstName) \(user.lastName)")
            .font(.title)
        Text(user.title)
            .italic()
        ImageView(imageName: "envelope.fill", text: user.email)
        ImageView(imageName: "link", text: user.companyUrl)
        ImageView(imageName: "location.fill", text: user.address)
        Button(action: {
            opacity = 0.5
        }){
            Label("Reset", systemImage: "clear.fill")
        }.padding(.top)
    }.foregroundColor(.white)
    ```

## Binding Stat เข้าไปใน ChartView
1. ส่งค่า Stat เข้าไปใน ChartView เพื่อคำนวนความสูงของ bar chart
    ```
    struct ChartView: View {
        var stat: Stat
        var body: some View {
            ....
        }
    }
    ```

1. กำหนดค่า stat สำหรับ Content Preview
    ```
    struct ChartView_Previews: PreviewProvider {
        static var previews: some View {
            ChartView(stat: Stat(ordered: 20, completed: 10, satisfaction: 15, delayDays: 10, duration: 30))
        }
    }
    ```
1. ส่งค่า __user.stat__ จาก CardDetail เข้ามาใน View
    ```
    if isChartVisible {
        ChartView(stat: user.stat)
            ...
    }
    ```
1. นำค่าไปคำนวนความสูงโดยใช้ ความสูงทั้งหมด x ค่าที่อยู่ใน stat และหารด้วย 100

    ```
    HStack(alignment: .bottom, spacing: 5) {
        Rectangle()
            .fill(Color.green)
            .frame(width: proxy.size.width / 5
                    , height: proxy.size.height * CGFloat(stat.ordered) / 100)
        Rectangle()
            .fill(Color.green)
            .frame(width: proxy.size.width / 5
                    , height: proxy.size.height * CGFloat(stat.completed) / 100)
        Rectangle()
            .fill(Color.green)
            .frame(width: proxy.size.width / 5
                    , height: proxy.size.height * CGFloat(stat.satisfaction) / 100)
        Rectangle()
            .fill(Color.green)
            .frame(width: proxy.size.width / 5
                    , height: proxy.size.height * CGFloat(stat.delayDays) / 100)
        Rectangle()
            .fill(Color.green)
            .frame(width: proxy.size.width / 5
                    , height: proxy.size.height * CGFloat(stat.duration) / 100)
    }
    ```
    > การคำนวนขนาดของการแสดงผลต้อง Cast ตัวแปร Int ไปเป็น CGFloat ก่อน

1. เพื่อให้การปรับเปลี่ยน bar chart ของเราทำได้ง่ายขึ้น เราจะแตกการแสดงผลของ bar ออกไปเป็น sub view เพื่อให้ง่ายในการแก้ไข
    * สร้างไฟล์ใหม่ขึ้นมาชื่อว่า BarView.swift
    * ย้าย Rectangle() ของเราไปไว้ใน BarView.swift
    * เปลี่ยน proxy.size.width, proxy.size.height และ value(ค่าที่รับมาจาก object stat) ไปเป็น parameters
        ```
        Rectangle()
            .fill(Color.green)
            .frame(width: width / 5
                    , height: height * CGFloat(value) / 100)
        ```
    * เปลี่ยน Rectangle() ในไฟล์ ChartView.swift ไปเป็น BarView
        ```
        BarView(size: proxy.size, value: stat.ordered)
        BarView(size: proxy.size, value: stat.completed)
        BarView(size: proxy.size, value: stat.satisfaction)
        BarView(size: proxy.size, value: stat.delayDays)
        BarView(size: proxy.size, value: stat.duration)
        ```

ดูเรื่อง [Animation](Amination.md) ต่อ