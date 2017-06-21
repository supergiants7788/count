//
//  ViewControllername.swift
//  count down3
//
//  Created by 新井山詠斗 on 2017/05/31.
//  Copyright © 2017年 新井山詠斗. All rights reserved.
//

import UIKit

class ViewControllername: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textfield.delegate = self
        textfield.placeholder = "テキストを入力"
        textfield.clearButtonMode = .always
        textfield.returnKeyType = .done
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        print("Clear")
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Start")
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("End")
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
