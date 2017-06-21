//
//  ViewControllernaming.swift
//  count down3
//
//  Created by 新井山詠斗 on 2017/05/31.
//  Copyright © 2017年 新井山詠斗. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textfield: UITextField!
    var text1: String = ""
    var text2: String = ""
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textfield.delegate = self
        textfield.placeholder = "タグの名前を入力"
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
        let alert: UIAlertController = UIAlertController(title: "確認", message: "\(textfield.text!)でよろしいですか？", preferredStyle:  UIAlertControllerStyle.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
            self.name = "\(self.textfield.text!)"
            self.performSegue(withIdentifier: "check", sender: nil)
            
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler:{
            
            (action: UIAlertAction!) -> Void in
        })
        
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "check"{
            let viewcontroller4 = segue.destination as! ViewController4
            viewcontroller4.text1 = self.text1
            viewcontroller4.text2 = self.text2
            viewcontroller4.name = self.name
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
