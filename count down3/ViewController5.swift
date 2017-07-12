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
    let month = DateFormatter()
    let day = DateFormatter()
    let hour = DateFormatter()
    let minute = DateFormatter()
    let second = DateFormatter()
    
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
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = text1
        label2.text = text2
        label1.isHidden = true
        label2.isHidden = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(mister), userInfo: nil, repeats: true)
    }
    
    func mister() {
        let nowDate = Date()
        year.dateFormat = "yyyy"
        let yearnum = Int(year.string(from: nowDate as Date))!
        month.dateFormat = "MM"
        let monthnum = Int(month.string(from: nowDate as Date))!
        day.dateFormat = "dd"
        let daynum = Int(day.string(from: nowDate as Date))!
        hour.dateFormat = "HH"
        let hournum = Int(hour.string(from: nowDate as Date))!
        minute.dateFormat = "mm"
        let minutenum = Int(minute.string(from: nowDate as Date))!
        second.dateFormat = "ss"
        let secondnum = Int(second.string(from: nowDate as Date))!
        
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
                if components.day == 0 {
                    test3.isHidden = true
                    if components.hour == 0 {
                        test4.isHidden = true
                        if components.minute == 0 {
                            test5.isHidden = true
                        }
                    }
                }
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
                amazing.text = end
                amazing2.text = dateFormatter.string(from: nowDate as Date)
            }
        }else{
            exciting.text = "\(name)まで"
            test.text = "\(components.year!) 年"
            test2.text = "\(components.month!) ヶ月"
            test3.text = "\(components.day!) 日"
            test4.text = "\(components.hour!) 時間"
            test5.text = "\(components.minute!) 分"
            test6.text = "\(components.second!) 秒"
            amazing.text = dateFormatter.string(from: nowDate as Date)
            amazing2.text = end
        }
    }
    
    @IBAction func list() {
        self.performSegue(withIdentifier: "list", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "list"{
            let viewcontrollerlist = segue.destination as! ViewControllerList
            viewcontrollerlist.text1 = self.text1
            viewcontrollerlist.text2 = self.text2
            viewcontrollerlist.tokyo = self.name
            print()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
