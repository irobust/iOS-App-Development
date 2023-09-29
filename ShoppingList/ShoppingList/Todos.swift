//
//  Todos.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import SwiftUI
import Alamofire

struct Todos: View {
    var todos: [TodoElement] = []
    var body: some View {
        VStack{
//            List {
//                ForEach(todos) { todo in
//                    Text(todo.title)
//                }
//            }
        }
        .onAppear {
            loadData()
        }
    }
    
    func loadData(){
        AF.request("https://jsonplaceholder.typicode.com/todos", method: .get)
          .responseDecodable(of: Todo.self) { response in
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
    }
    
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
