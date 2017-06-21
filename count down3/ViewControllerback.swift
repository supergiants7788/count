//
//  ViewControllerback.swift
//  count down3
//
//  Created by 新井山詠斗 on 2016/12/07.
//  Copyright © 2016年 新井山詠斗. All rights reserved.
//

import UIKit

class ViewControllerback: UIViewController, UITextFieldDelegate {
    let nowDate = Date()
    let dateFormat = DateFormatter()
    let year = DateFormatter()
    @IBOutlet weak var yearlabel: UILabel!
    let month = DateFormatter()
    @IBOutlet weak var monthlabel: UILabel!
    let day = DateFormatter()
    @IBOutlet weak var daylabel: UILabel!
    let inputDatePicker = UIDatePicker()
    @IBOutlet weak var dateSelecter: UITextField!
    
//    var music: String = ""
    var music: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormat.dateFormat = "yyyy年MM月dd日"
        dateSelecter.text = dateFormat.string(from: nowDate as Date)
        year.dateFormat = "yyyy"
        yearlabel.text = year.string(from: nowDate as Date)
        month.dateFormat = "MM"
        monthlabel.text = month.string(from: nowDate as Date)
        day.dateFormat = "dd"
        daylabel.text = day.string(from: nowDate as Date)
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
        yearlabel.isHidden = true
        monthlabel.isHidden = true
        daylabel.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "turn"{
            let viewcontroller2 = segue.destination as! ViewController3
            viewcontroller2.text1 = self.dateSelecter.text!
            viewcontroller2.text2 = self.music
        }
        if segue.identifier == "same"{
            let viewcontrollersame = segue.destination as! ViewControllersame
            viewcontrollersame.date2 = self.dateSelecter.text!
        }
    }
    func dispAlert(sender: UIBarButtonItem) {
        let pickerDate = inputDatePicker.date
        dateSelecter.text = dateFormat.string(from: pickerDate)
        self.view.endEditing(true)
        let dateString = dateSelecter.text
        let set = CharacterSet(charactersIn: "年月日")
        let dateArray = dateString?.components(separatedBy: set)
        var dateTuple = (0, 0, 0)
        dateTuple.0 = Int((dateArray?[0])!) ?? -1
        dateTuple.1 = Int((dateArray?[1])!) ?? -1
        dateTuple.2 = Int((dateArray?[2])!) ?? -1
        let str = yearlabel.text
        let strnum = Int((str)!)!
        let str2 = monthlabel.text
        let strnum2 = Int((str2)!)!
        let str3 = daylabel.text
        let strnum3 = Int((str3)!)!
        
        if strnum > dateTuple.0 {
            alert()
        }else if strnum == dateTuple.0 {
            if strnum2 > dateTuple.1 {
                alert()
            }else if strnum2 == dateTuple.1 {
                if strnum3 > dateTuple.2 {
                    alert()
                }else if strnum3 == dateTuple.2{
                    self.performSegue(withIdentifier: "same", sender: nil)
                }else{
                    self.performSegue(withIdentifier: "turn", sender: nil)
                }
            }else{
                self.performSegue(withIdentifier: "turn", sender: nil)
            }
        }else{
            self.performSegue(withIdentifier: "turn", sender: nil)
        }
    }
    
    func alert() {
        let alert: UIAlertController = UIAlertController(title: "無効な年月日", message: "今日か未来の年月日を入力してください。", preferredStyle:  UIAlertControllerStyle.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
        })
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
        dateFormat.dateFormat = "yyyy年MM月dd日"
        dateSelecter.text = dateFormat.string(from: nowDate as Date)
    }
    
    @IBAction func through() {
        self.performSegue(withIdentifier: "same", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
