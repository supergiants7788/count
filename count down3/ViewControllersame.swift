//
//  ViewControllersame.swift
//  count down3
//
//  Created by 新井山詠斗 on 2016/12/04.
//  Copyright © 2016年 新井山詠斗. All rights reserved.
//

import UIKit
    class ViewControllersame: UIViewController, UITextFieldDelegate {
        let nowDate = Date()
        let dateFormat = DateFormatter()
        let hour = DateFormatter()
        @IBOutlet weak var hourlabel: UILabel!
        let minute = DateFormatter()
        @IBOutlet weak var minutelabel: UILabel!
        let inputDatePicker = UIDatePicker()
        @IBOutlet weak var dateSelecter: UITextField!
        var date2: String = ""
        @IBOutlet weak var christmas: UILabel!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            christmas.text = date2
            dateFormat.dateFormat = "HH時mm分"
            dateSelecter.text = dateFormat.string(from: nowDate as Date)
            hour.dateFormat = "HH"
            hourlabel.text = hour.string(from: nowDate as Date)
            minute.dateFormat = "mm"
            minutelabel.text = minute.string(from: nowDate as Date)
            self.dateSelecter.delegate = self
            
            inputDatePicker.datePickerMode = UIDatePickerMode.time
            dateSelecter.inputView = inputDatePicker
            let pickerToolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
            pickerToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
            pickerToolBar.barStyle = .blackTranslucent
            pickerToolBar.tintColor = UIColor.white
            pickerToolBar.backgroundColor = UIColor.black
            let spaceBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace,target: self, action: nil)
            let toolBarBtn = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(dispAlert(sender:)))
            pickerToolBar.items = [spaceBarBtn,toolBarBtn]
            dateSelecter.inputAccessoryView = pickerToolBar
            hourlabel.isHidden = true
            minutelabel.isHidden = true
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "check"{
                let viewcontroller3 = segue.destination as! ViewController2same
                viewcontroller3.text1 = self.date2
                viewcontroller3.text2 = self.dateSelecter.text!
            }
        }
        
        
        func dispAlert(sender: UIBarButtonItem) {
            let pickerDate = inputDatePicker.date
            dateSelecter.text = dateFormat.string(from: pickerDate)
            self.view.endEditing(true)
            
            let dateString = dateSelecter.text
            let set = CharacterSet(charactersIn: "時分")
            let dateArray = dateString?.components(separatedBy: set)
            var dateTuple = (0, 0)
            dateTuple.0 = Int((dateArray?[0])!) ?? -1
            dateTuple.1 = Int((dateArray?[1])!) ?? -1
            let str = hourlabel.text
            let strnum = Int((str)!)!
            let str2 = minutelabel.text
            let strnum2 = Int((str2)!)!
            
            if strnum > dateTuple.0 {
                alert()
            }else if strnum == dateTuple.0 {
                if strnum2 > dateTuple.1 {
                    alert()
                }else if strnum2 == dateTuple.1 {
                    alert2()
                }else{
                    self.performSegue(withIdentifier: "check", sender: nil)
                }
            }else{
                self.performSegue(withIdentifier: "check", sender: nil)
            }
        }
        
        func alert() {
            let alert: UIAlertController = UIAlertController(title: "無効な時刻", message: "未来の時刻を入力してください。", preferredStyle:  UIAlertControllerStyle.alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
        }
        func alert2() {
            let alert: UIAlertController = UIAlertController(title: "現在時刻です。", message: "未来の時刻を入力してください。", preferredStyle:  UIAlertControllerStyle.alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    }
