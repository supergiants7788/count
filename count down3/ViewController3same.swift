//
//  ViewController3same.swift
//  count down3
//
//  Created by 新井山詠斗 on 2016/12/04.
//  Copyright © 2016年 新井山詠斗. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController3same: UIViewController {
    @IBOutlet weak var label1: UILabel!
    var text1: String = ""
    @IBOutlet weak var label2: UILabel!
    var text2: String = ""
    
    
    let hour = DateFormatter()
    @IBOutlet weak var hourlabel: UILabel!
    let minute = DateFormatter()
    @IBOutlet weak var minutelabel: UILabel!
    let second = DateFormatter()
    @IBOutlet weak var secondlabel: UILabel!
    
    let dateFormatter = DateFormatter()
    let cal = Calendar.current
    let calUnit = Set<Calendar.Component>([.hour, .minute, .second])
    
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var test2: UILabel!
    @IBOutlet weak var test3: UILabel!
    
    var timer: Timer!
    
    @IBOutlet weak var amazing: UILabel!
    @IBOutlet weak var amazing2: UILabel!
    @IBOutlet weak var amazing3: UILabel!
    @IBOutlet weak var amazing4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = text1
        label2.text = text2
        hourlabel.isHidden = true
        minutelabel.isHidden = true
        secondlabel.isHidden = true
        label1.isHidden = true
        label2.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(through), userInfo: nil, repeats: true)
    }
    
    func through() {
        let nowDate = Date()
        hour.dateFormat = "HH"
        hourlabel.text = hour.string(from: nowDate as Date)
        minute.dateFormat = "mm"
        minutelabel.text = minute.string(from: nowDate as Date)
        second.dateFormat = "ss"
        secondlabel.text = second.string(from: nowDate as Date)
        
        let dateString = label2.text
        let set = CharacterSet(charactersIn: "時分")
        let dateArray = dateString?.components(separatedBy: set)
        var dateTuple = (0, 0)
        dateTuple.0 = Int((dateArray?[0])!) ?? -1
        dateTuple.1 = Int((dateArray?[1])!) ?? -1
        let str = hourlabel.text
        let hournum = Int((str)!)!
        let str2 = minutelabel.text
        let minutenum = Int((str2)!)!
        let str3 = secondlabel.text
        let secondnum = Int((str3)!)!
        
        let start = "\(hournum):\(minutenum):\(secondnum)"
        let end = "\(dateTuple.0):\(dateTuple.1):00"
        dateFormatter.dateFormat = "HH:mm:ss"
        let startDate:NSDate? = dateFormatter.date(from: start) as NSDate?
        let endDate:NSDate? = dateFormatter.date(from: end) as NSDate?
        let components = cal.dateComponents(calUnit, from: startDate as! Date, to: endDate as! Date)
        test.text = "\(components.hour!)"
        test2.text = "\(components.minute!)"
        test3.text = "\(components.second!)"
        
        if components.hour == components.minute && components.minute == components.second{
            timer.invalidate()
        }
        let nowDate2 = Date()
        let dateFormatter2 = DateFormatter()
        
        dateFormatter2.dateFormat = "HH:mm:ss"
        amazing.text = dateFormatter2.string(from: nowDate2 as Date)
        amazing2.text = end
        
        amazing3.text = text1
        amazing4.text = text1
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
