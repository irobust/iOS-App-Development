//
//  Todos.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import SwiftUI
import Alamofire

struct Todos: View {
    @StateObject var todoViewModel = TodoViewModel()
    
    // ตัวแปรนี้จะไม่ใช้แล้วหลังจากมี ViewModel
    @State var todos: [TodoElement] = []
    var body: some View {
        VStack{
            List {
                ForEach(todoViewModel.todos) { todo in
                    Text(todo.title)
                }
            }
        }
        .onAppear {
            todoViewModel.loadData()
        }
    }
    
    // ฟังก์ชั้นนี้จะไม่ใช้แล้วหลังจากมี ViewModel
    func loadData(){
        AF.request("https://jsonplaceholder.typicode.com/todos", method: .get)
          .responseDecodable(of: Todo.self) { response in
            switch response.result {
            case .success:
                let result = response.value ?? []
                self.todos.removeAll()
                self.todos.append(contentsOf: result)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // ฟังก์ชั้นนี้จะไม่ใช้แล้วหลังจากมี ViewModel
    func loadStringData(){
        AF.request("https://jsonplaceholder.typicode.com/todos", method: .get)
            .responseString { response in
                switch response.result {
                case .success(let value):
                    print(value)
                case .failure(let error):
                    print(error)
                }
        }
    }
}

struct Todos_Previews: PreviewProvider {
    static var previews: some View {
        Todos()
    }
}
