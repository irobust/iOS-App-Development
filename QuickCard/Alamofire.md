# ทำงานกับ API ด้วย Alamofire
## ติดตั้ง Almofire
1. เพิ่ม pod 'Alamofire' เข้าไปใน __Podfile__
    ```
    target 'ชื่อ Project' do
        ...
        pod 'Alamofire', '~> 5.8'
    end
    ```
1. ติดตั้ง Alamofire
    ```
    pod install
    ```
1. Build project ใหม่อีกรอบ

## ทดสอบการรับ Response จาก API
### รับ Response เป็น String
1. ตรวจสอบผลลัพธ์ด้วยการใช้ debugPrint
    ```
    AF.request("https://jsonplaceholder.typicode.com/todos").response { response in
        debugPrint(response) 
    }
    ```
1. จัดการกับ Error
    ```
    AF.request("https://jsonplaceholder.typicode.com/todo", method: .get).responseString { response in
        switch response.result {
        case .success(let value):
            print(value)
        case .failure(let error):
            print(error)
        }
    }
    ```
### รับ Response เป็น JSON
1. สร้าง Model เพื่อรับ Response
    ```
    struct TodoElement: Codable {
        let userID, id: Int
        let title: String
        let completed: Bool

        enum CodingKeys: String, CodingKey {
            case userID = "userId"
            case id, title, completed
        }
    }

    typealias Todo = [TodoElement]
    ```

    สามารถนำ response จาก API ไป generate struct หรือ class เองได้ที่ https://app.quicktype.io
    
1. เปลี่ยนจาก responseString ไปเป็น responseJSON
    ```
    AF.request(BASE_URL, method: .get).responseDecodable(of: Todo.self) { response in
        switch response.result {
        case .success:
            let result = response.value ?? []
            for todo in result {
                print(todo.title)
            }
        case .failure(let error):
            print(error)
        }
    }
    ```

## จำลอง Server ด้วย JSON Server
### Allow HTTP protocol
1. เลือก Project > Info
1. คลิกขวา Add Row เลือก __App Transport Security Testing__
1. กดปุ่ม + เพิ่ม __Allow Arbitary Network__
1. Set เป็น __YES__

## ดึงผลลัพธ์จาก API ไปแสดงใน List
