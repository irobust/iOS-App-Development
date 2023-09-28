# Persistance data
## ติดตั้ง Realm
1. ใช้คำสั่ง gem install เพื่อติดตั้ง Cocopods
    ```
    sudo gem install cocoapods
    ```
    หรือ

    ```
    brew install cocoapods
    ```

2. ติดตั้ง Package ที่ต้องการใช้งานโดยสร้าง podfile ขึ้นมาด้วยคำสั่ง
    ```
    pod init
    ```
3. บรรจุ realm ไว้ใน podfile ที่ได้สร้างขึ้น
    ```
    platform :ios, '12.0'
    target 'QuickCardApp' do
        use_frameworks!
        pod 'RealmSwift', '~>10'
    end
    ```
1. Install dependencies (ต้องอยู่ใน Path ที่มี .xcodeproj)
    ```
    pod install
    ```
1. ปิด project แล้วเปิด workspace ใหม่โดยใช้ command
    ```
    open QuickCardApp.xcworkspace
    ```

1. เปิดไฟล์ ContentView.swift แล้ว import RealmSwift
    ```
    import RealmSwift
    ```
1. ลอง Build workspace ใหม่ ถ้าไม่มี Error ถือว่าการติดตั้งสมบูรณ์ (ยังมี Warning อยู่ไม่เป็นไร)

## สร้างหน้า Add UI
1. เอา NavigationView มาครอบ VStack
    ```
    NavigationView {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
    ```
1. เพิ่ม Toolbar item โดยเพิ่ม .toolbar เข้าไป
    ```
    NavigationView {
        VStack {
            ...
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isPresented = true
                }){
                    Image(systemName: "plus")
                }
            }
        }
    }
    ```
1. เพิ่มหน้าเข้าไปใหม่ แต่ให้แสดงผลเป็นส่วนหนึ่งของหน้าเดิมด้วย sheet

    ```
    NavigationView {
        VStack {
            ...
        }
        .padding()
        .toolbar {
            ...
        }
        .sheet(isPresented: $isPresented, content: {
            AddShoppingList()
        })
    }
    ```
1. หลังจากนั้นเข้าไปที่หน้า AddShoppingList.swift แล้วเพิ่ม @State title และ address
    ```
    @State var title = ""
    @State var address = ""
    ```

1. เพิ่ม Form เข้าไป โดยใน Form จะมี Textfield 2 ตัวเพื่อ Binding เข้ากับ title และ address
    ```
    Form {
        TextField("Title: ", text: $title)
        TextField("Address: ", text: $address)
    }
    .navigationTitle("New item")
    ```
1. เพิ่มปุ่ม Save เข้าไปใน Form
    ```
    Form {
        ...
        
        Button(action: {
            dismiss()
        }){
            Text("Save")
                .frame(maxWidth: .infinity)
        }.buttonStyle(.bordered)
    }
    ```

1. เราต้องการให้กด Save แล้วปิดหน้านี้ให้ไปดึงเอาตัวแปร Environment ชื่อ dismiss มาใช้
    * เพิ่ม @Environment
        ```
        @Environment(\.dismiss) private var dismiss
        ```
    * เรียกใช้ function dismiss
        ```
        Button(action: {
            dismiss()
        })
        ```
## สร้าง Model
1. สร้าง Group ชื่อ Models
1. สร้างไฟล์ชื่อ ShoppingList.swift
1. นิยาม Class ของ Object ที่จะนำไปเก็บไว้ใน Realm
    ```
    class ShoppingList: Object, ObjectKeyIdentifiable{
        @Persisted(primaryKey: true) var id: ObjectId
        @Persisted var title: String
        @Persisted var address: String
    }
    ```
1. นำตัวไปสร้างเป็นตัวแปรเพื่อใช้งานในหน้า AddShoppingList.swift
    ```
    import RealmSwift
    
    struct AddShoppingList: View {
        @ObservedResults(ShoppingList.self) var shoppingLists

        ...
    }
    ```
1. สร้าง shopping list record ก่อน dismiss()
    ```
    let shoppingList = ShoppingList()
    shoppingList.title = title
    shoppingList.address = address
    $shoppingLists.append(shoppingList)
    ```
1. หลังจาก save แล้วให้ไปตรวจสอบว่าข้อมูลเข้าหรือไม่ด้วย MongoDB Realm Studio (ถ้ายังไม่มีต้องไป install ก่อน)
1. ตั้ง breakpoint ไว้ที่ dismiss()
1. พิมพิ์ command ใน lldb
    ```
    (lldb) po NSHomeDirectory()
    ```
1. เปิด Finder เลือก Go > Go to Folder
1. เอา Path ที่ได้จากขั้นตอนก่อนหน้าไปวาง
1. เปิดไฟล์ default.realm (เราใช้ default configuration)

## สร้างหน้า Listview
1. กลับไปที่หน้า ContentView แล้ว __import RealmSwift__
1. เพิ่มตัวแปร @ObservedResults
    ```
    @ObservedResults(ShoppingList.self) var shoppingLists
    ```
1. ตรวจสอบว่าใน shoppingLists มีรายการสินค้าอยู่รึเปล่า
    ```
    VStack {
        if shoppingLists.isEmpty {
            Text("No shopping lists")
        }
    }
    ```
1. เพิ่ม list item เข้าไป
    ```
    List {
        ForEach(shoppingLists) { shoppingList in
            Text(shoppingList.title)
        }
    }
    ```
1. เพิ่ม Address เข้าไปใน List
    ```
    VStack{
        Text(shoppingList.title).font(.headline)
        Text(shoppingList.address)
            .font(.subheadline)
            .opacity(0.5)
    }
    ```
1. เพิ่มการ Delete Shopping List
    ```
    List{
        ForEach(shoppingLists) { shoppingList in
            ...
        }.onDelete(perform: $shoppingLists.remove)
    }
    ```
## เพิ่ม Relationship
1. สร้างไฟล์ ShoppingItem.swift ขึ้นมาใน Models Group
1. สร้าง class ShoppingItem
    ```
    import RealmSwift
    class ShoppingItem: Object, ObjectKeyIdentifiable{
        @Persisted(primaryKey: true) var id: ObjectId
        @Persisted var title: String
        @Persisted var qty: Int
    }
    ```
1. สร้าง relationship ระหว่าง shoppingList กับ ShoppingItem
    ```
    class ShoppingList: Object, ObjectKeyIdentifiable{
        ...
        @Persisted var items: List<ShoppingItem> = List<ShoppingItem>()
    }
    ```
1. หลังจากนี้จะเกิด Error เนื่องจาก List<ShoppingItem> ไม่ได้มีการ initialize ใน version ก่อนหน้าดังนั้นเราจึงต้องสร้าง Migrator เพื่อเปลี่ยนโครงสร้างของ Database ดังนี้
    * สร้าง File Migrator.swift ขึ้นมาใน group Utils
        ```
        import Foundation
        import RealmSwift

        class Migrator {
            init(){
                updateSchema()
            }
            
            func updateSchema(){
                let config = Realm.Configuration(schemaVersion: 1){ migration, oldSchemaVersion in
                    if(oldSchemaVersion < 1) {
                        migration.enumerateObjects(ofType: ShoppingList.className()) { _, newObject in
                            newObject!["items"] = List<ShoppingItem>()
                        }
                    }
                }
                
                Realm.Configuration.defaultConfiguration = config
                let _ = try! Realm()
            }
        }
        ```
    * เอา Migrator ไปประกาศไว้ใน Main (ชื่อ Project.swift)
        ```
        @main
        struct demo2App: App {
            let migrator = Migrator()
            ...
        }
        ```

    เราอาจใช้วิธีลบ Application แล้วลงใหม่ก็ได้ แต่เราจะใช้กับ User จริงๆไม่ได้

## สร้างหน้า Add Shopping Items
1. เพิ่ม Navigation Link ครอบ ShoppingList ใน ForEach (อยู่ในหน้า ContentView)
    ```
    ForEach(shoppingLists) { shoppingList in
        NavigationLink(destination: Text("Destination")) {
            VStack{
                ....
            }
        }
    }
    ```
1. สร้างไฟล์ ShoppingListItemView.swift
1. สร้าง View ที่มี toolbar และ sheet view เหมือนหน้าแรก
    ```
    VStack{
        Text("Item")
        .navigationTitle("Test")
    }
    .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
                isPresented = true
            }){
                Image(systemName: "plus")
            }
        }
    }
    .sheet(isPresented: $isPresented, content: {
        AddShoppingListItem()
    })
    ```
1. เนื่องจากมีการใส่ NavigationTitle ให้เราเพิ่ม Navigation View เข้าไปใน Content preview
    ```
    static var previews: some View {
        NavigationView{
            ShoppingListItem()
        }
    }
    ```
1. เพิ่มหน้า AddShoppingListItem.swift เหมือนใน step ก่อนหน้า
1. ในหน้านี้จะต้องรับตัวแปร ShoppingList เข้ามาทาง parameter เราจึงต้องประกาศตัวแปรไว้รับค่า
    ```
    @ObservedRealmObject var shoppingList: ShoppingList
    ```
1. เมื่อประกาศตัวแปรขึ้นมาแต่ไม่มีค่า default จึงเกิด error ขึ้นใน Content Preview เราต้องใส่ shoppingList ให้ดังนี้
    ```
    static var previews: some View {
            AddShoppingListItem(shoppingList: ShoppingList())
    }
    ```

1. กลับไปแก้หน้า ShoppingListItem.swift ไปเพิ่มตัวแปร shoppingList ที่จะส่งเข้ามาเหมือนในหน้า AddShoppingListItem
    ```
    @ObservedRealmObject var shoppingList: ShoppingList
    ```
1. และจะมี Error เกิดขึ้นที่ Content Preview เหมือนเดิมให้แก้เหมือนกับหน้า AddShoppingListItem
    ```
    static var previews: some View {
        NavigationView{
            ShoppingListItem(shoppingList: ShoppingList())
        }
    }
    ```
1. ใส่ shoppingList เข้ามาจาก ForEach loop ในหน้า ContentView.swift
    ```
    ForEach(shoppingLists) { shoppingList in
        NavigationLink(destination: ShoppingListItem(shoppingList: shoppingList)) {
            VStack{
                ....
            }
        }
    }
    ```
1. เพิ่ม ตัวแปรสำหรับการระบุ column
    ```
    let columns = Array(repeating: GridItem(), count: 3)
    let categories = ["electric", "fruit", "food", "beverages", "snack", "equipments"]
    ```
1. เพิ่ม LazyVGrid เข้าไป
    ```
    LazyVGrid(columns: columns,spacing: 5) {
        ForEach(categories, id: \.self){ item in
            Text(item)
                .padding()
                .frame(width: 130)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous ))
                .foregroundColor(.white)
                
        }
    }.padding()
    ```
1. เพิ่ม @State สำหรับ Selected category
    ```
    @State private var selectedCategory = ""
    ```
1. ใส่เงื่อนไขใน background
    ```
    .backgound(selectedCategory == item ? .blue : .orange)
    ```
1. เพ่ิม TextFied ในหน้า AddShoppingItem
    ```
    NavigationView {
        ...
        Form {
            TextField("Title: ", text: $title)
            TextField("quantity: ", text: $qty)
            
            Button(action: {
                
                // Add Shopping List Item Here

                dismiss()
            }){
                Text("Save")
                    .frame(maxWidth: .infinity)
            }.buttonStyle(.bordered)
        }
    }
    ```
1. เพิ่มตัวแปร State สำหรับ input ที่เราจะใส่เข้าไป 2 ตัวคือ title และ quantity
    ```
    @State private var title = ""
    @State private var qty = ""
    ```
1. เพิ่ม Category เข้าไปใน ShoppingItem
    ```
    @Persisted var category: String
    ```
1. เพิ่ม Schema เข้าไปใน function updateSchema ใน Migrartor
    ```
    let config = Realm.Configuration(schemaVersion: 2){ migration, oldSchemaVersion in
                    ...
                    if(oldSchemaVersion < 2) {
                        migration.enumerateObjects(ofType: ShoppingList.className()) { _, newObject in
                            newObject!["category"] = ""
                        }
                    }
                }
    ```
1. เพิ่ม shoppingListItem เข้าไปใน ShoppingList
    ```
    let shoppingItem = ShoppingItem()
    shoppingItem.title = title
    shoppingItem.qty = Int(qty) ?? 1
    shoppingItem.category = selectedCategory
    $shoppingList.items.append(shoppingItem)

    dismiss()
    ```