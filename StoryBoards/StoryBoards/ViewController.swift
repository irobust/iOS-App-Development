//
//  ViewController.swift
//  StoryBoards
//
//  Created by Phanupong Permpimol on 22/9/2566 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var labelHello: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelHello.text = "Hello World!"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textName.becomeFirstResponder()
    }

    @IBAction func buttonClick(_ sender: Any) {
//        if let name = textName.text {
//            labelHello.text = "Hello \(name)"
//        }else {
//            labelHello.text = "Please input your name"
//        }
        
        let name = textName.text ?? ""
        labelHello.text = "Hello \(name)"
        
        textName.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textName.resignFirstResponder()
    }
}

