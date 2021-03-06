//
//  ViewController.swift
//  count down3
//
//  Created by 新井山詠斗 on 2016/11/30.
//  Copyright © 2016年 新井山詠斗. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let nowDate = Date()
    let dateFormat = DateFormatter()
    let year = DateFormatter()
    let month = DateFormatter()
    let day = DateFormatter()
    let inputDatePicker = UIDatePicker()
    @IBOutlet weak var dateSelecter: UITextField!
    
    var yearString: String!
    var monthString: String!
    var dayString: String!
    
    var height: CGFloat = UIScreen.main.bounds.size.height
    var width: CGFloat = UIScreen.main.bounds.size.width

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormat.dateFormat = "yyyy年MM月dd日"
        dateSelecter.text = dateFormat.string(from: nowDate as Date)
        year.dateFormat = "yyyy"
        yearString = year.string(from: nowDate as Date)
        month.dateFormat = "MM"
        monthString = month.string(from: nowDate as Date)
        day.dateFormat = "dd"
        dayString = day.string(from: nowDate as Date)
        self.dateSelecter.delegate = self
        inputDatePicker.datePickerMode = UIDatePickerMode.date
        
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

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "second"{
            let viewcontroller2 = segue.destination as! ViewController2
            viewcontroller2.date = self.dateSelecter.text!
        }
    }
    func dispAlert(sender: UIBarButtonItem) {
        let pickerDate = inputDatePicker.date
        dateSelecter.text = dateFormat.string(from: pickerDate)
        self.view.endEditing(true)
        self.performSegue(withIdentifier: "second", sender: nil)
        
}
    
    @IBAction func through() {
        self.performSegue(withIdentifier: "second", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

