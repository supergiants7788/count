//
//  ViewControllername.swift
//  count down3
//
//  Created by 新井山詠斗 on 2016/12/06.
//  Copyright © 2016年 新井山詠斗. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {
    @IBOutlet weak var label1: UILabel!
    var text1: String = ""
    @IBOutlet weak var label2: UILabel!
    var text2: String = ""
    let year = DateFormatter()
    @IBOutlet weak var yearlabel: UILabel!
    let month = DateFormatter()
    @IBOutlet weak var monthlabel: UILabel!
    let day = DateFormatter()
    @IBOutlet weak var daylabel: UILabel!
    let hour = DateFormatter()
    @IBOutlet weak var hourlabel: UILabel!
    let minute = DateFormatter()
    @IBOutlet weak var minutelabel: UILabel!
    let second = DateFormatter()
    @IBOutlet weak var secondlabel: UILabel!
    
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var test2: UILabel!
    @IBOutlet weak var test3: UILabel!
    @IBOutlet weak var test4: UILabel!
    @IBOutlet weak var test5: UILabel!
    @IBOutlet weak var test6: UILabel!
    
    @IBOutlet weak var amazing: UILabel!
    @IBOutlet weak var amazing2: UILabel!
    
    @IBOutlet weak var exciting: UILabel!
    
    let dateFormatter = DateFormatter()
    let cal = Calendar.current
    let calUnit = Set<Calendar.Component>([.year, .month, .day, .hour, .minute, .second])
    
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yearlabel.isHidden = true
        monthlabel.isHidden = true
        daylabel.isHidden = true
        hourlabel.isHidden = true
        minutelabel.isHidden = true
        secondlabel.isHidden = true
        label1.text = text1
        label2.text = text2
        label1.isHidden = true
        label2.isHidden = true
        
        Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(mister), userInfo: nil, repeats: true)
    }
    
    func mister() {
        let nowDate = Date()
        year.dateFormat = "yyyy"
        yearlabel.text = year.string(from: nowDate as Date)
        month.dateFormat = "MM"
        monthlabel.text = month.string(from: nowDate as Date)
        day.dateFormat = "dd"
        daylabel.text = day.string(from: nowDate as Date)
        hour.dateFormat = "HH"
        hourlabel.text = hour.string(from: nowDate as Date)
        minute.dateFormat = "mm"
        minutelabel.text = minute.string(from: nowDate as Date)
        second.dateFormat = "ss"
        secondlabel.text = second.string(from: nowDate as Date)
        
        let dateString = label1.text
        let set = CharacterSet(charactersIn: "年月日")
        let dateArray = dateString?.components(separatedBy: set)
        var dateTuple = (0, 0, 0)
        dateTuple.0 = Int((dateArray?[0])!) ?? -1
        dateTuple.1 = Int((dateArray?[1])!) ?? -1
        dateTuple.2 = Int((dateArray?[2])!) ?? -1
        let dateString2 = label2.text
        let set2 = CharacterSet(charactersIn: "時分")
        let dateArray2 = dateString2?.components(separatedBy: set2)
        var dateTuple2 = (0, 0)
        dateTuple2.0 = Int((dateArray2?[0])!) ?? -1
        dateTuple2.1 = Int((dateArray2?[1])!) ?? -1
        let str = yearlabel.text
        let yearnum = Int((str)!)!
        let str2 = monthlabel.text
        let monthnum = Int((str2)!)!
        let str3 = daylabel.text
        let daynum = Int((str3)!)!
        let str4 = hourlabel.text
        let hournum = Int((str4)!)!
        let str5 = minutelabel.text
        let minutenum = Int((str5)!)!
        let str6 = secondlabel.text
        let secondnum = Int((str6)!)!
        
        let start = "\(yearnum)/\(monthnum)/\(daynum) \(hournum):\(minutenum):\(secondnum)"
        let end = "\(dateTuple.0)/\(dateTuple.1)/\(dateTuple.2) \(dateTuple2.0):\(dateTuple2.1):00"
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let startDate:NSDate? = dateFormatter.date(from: start) as NSDate?
        let endDate:NSDate? = dateFormatter.date(from: end) as NSDate?
        var components = cal.dateComponents(calUnit, from: startDate! as Date, to: endDate! as Date)
        if components.year == 0 {
            test.isHidden = true
            if components.month == 0 {
                test2.isHidden = true
            }
        }
        if components.second! <= 0  {
            if exciting.text == "\(name)まで"{
                test.text = "\(components.year!) 年"
                test2.text = "\(components.month!) ヶ月"
                test3.text = "\(components.day!) 日"
                test4.text = "\(components.hour!) 時間"
                test5.text = "\(components.minute!) 分"
                test6.text = "\(components.second!) 秒"
            }else{
                exciting.text = "\(name)から"
                test.text = "\(components.year! * -1) 年"
                test2.text = "\(components.month! * -1) ヶ月"
                test3.text = "\(components.day! * -1) 日"
                test4.text = "\(components.hour! * -1) 時間"
                test5.text = "\(components.minute! * -1) 分"
                test6.text = "\(components.second! * -1) 秒"
                let nowDate2 = Date()
                let dateFormatter2 = DateFormatter()
                dateFormatter2.dateFormat = "yyyy/MM/dd HH:mm:ss"
                amazing.text = end
                amazing2.text = dateFormatter2.string(from: nowDate2 as Date)
            }
        }else{
            exciting.text = "\(name)まで"
            test.text = "\(components.year!) 年"
            test2.text = "\(components.month!) ヶ月"
            test3.text = "\(components.day!) 日"
            test4.text = "\(components.hour!) 時間"
            test5.text = "\(components.minute!) 分"
            test6.text = "\(components.second!) 秒"
            let nowDate2 = Date()
            let dateFormatter2 = DateFormatter()
            dateFormatter2.dateFormat = "yyyy/MM/dd HH:mm:ss"
            amazing.text = dateFormatter2.string(from: nowDate2 as Date)
            amazing2.text = end
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
