//
//  ViewController2.swift
//  count down3
//
//  Created by 新井山詠斗 on 2016/11/30.
//  Copyright © 2016年 新井山詠斗. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITextFieldDelegate {
    let nowDate = Date()
    let dateFormat = DateFormatter()
    let dateFormat2 = DateFormatter()
    let inputDatePicker = UIDatePicker()
    let inputDatePicker2 = UIDatePicker()
    @IBOutlet weak var dateSelecter: UITextField!
    var date: String = ""
    @IBOutlet weak var chosenDate: UILabel!
    
    let year = DateFormatter()
    let month = DateFormatter()
    let day = DateFormatter()
    let hour = DateFormatter()
    let minute = DateFormatter()
    
    var yearString: String!
    var monthString: String!
    var dayString: String!
    var hourString: String!
    var minuteString: String!
    
    var height: CGFloat = UIScreen.main.bounds.size.height
    var width: CGFloat = UIScreen.main.bounds.size.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chosenDate.text = date
        dateFormat.dateFormat = "yyyy年MM月dd日"
        dateFormat2.dateFormat = "HH時mm分"
        dateSelecter.text = dateFormat2.string(from: nowDate as Date)
        year.dateFormat = "yyyy"
        yearString = year.string(from: nowDate as Date)
        month.dateFormat = "MM"
        monthString = month.string(from: nowDate as Date)
        day.dateFormat = "dd"
        dayString = day.string(from: nowDate as Date)
        hour.dateFormat = "HH"
        hourString =  hour.string(from: nowDate as Date)
        minute.dateFormat = "mm"
        minuteString = minute.string(from: nowDate as Date)
        inputDatePicker.datePickerMode = UIDatePickerMode.date
        inputDatePicker2.datePickerMode = UIDatePickerMode.time
        self.dateSelecter.delegate = self
        
        dateSelecter.inputView = inputDatePicker2
        let pickerToolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        pickerToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        pickerToolBar.barStyle = .blackTranslucent
        pickerToolBar.tintColor = UIColor.white
        pickerToolBar.backgroundColor = UIColor.black
        let spaceBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace,target: self, action: nil)
        let pickerDate = inputDatePicker.date
        dateSelecter.text = dateFormat2.string(from: pickerDate)
        self.view.endEditing(true)
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(dispAlert(sender:)))
        pickerToolBar.items = [spaceBarBtn,toolBarBtn]
        dateSelecter.inputAccessoryView = pickerToolBar
    }
    
    func dispAlert(sender: UIBarButtonItem) {
        let pickerDate = inputDatePicker2.date
        dateSelecter.text = dateFormat2.string(from: pickerDate)
        self.view.endEditing(true)
            self.performSegue(withIdentifier: "naming", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "naming"{
            let viewcontroller3 = segue.destination as! ViewController3
            viewcontroller3.text1 = self.date
            viewcontroller3.text2 = self.dateSelecter.text!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
