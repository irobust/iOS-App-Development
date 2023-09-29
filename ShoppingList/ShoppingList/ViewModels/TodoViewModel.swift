//
//  TodoViewModel.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import Foundation
import Alamofire

class TodoViewModel: ObservableObject{
    @Published var todos: [TodoElement] = []
    
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
}
