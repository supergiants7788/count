//
//  ViewControllerResult.swift
//  count down3
//
//  Created by 新井山詠斗 on 2017/08/30.
//  Copyright © 2017年 新井山詠斗. All rights reserved.
//

import UIKit

class ViewControllerResult: UIViewController {

    let year = DateFormatter()
    let month = DateFormatter()
    let day = DateFormatter()
    let hour = DateFormatter()
    let minute = DateFormatter()
    let second = DateFormatter()
    
    var timer: Timer!
    
    let dateFormatter = DateFormatter()
    let cal = Calendar.current
    let calUnit = Set<Calendar.Component>([.year, .month, .day, .hour, .minute, .second])
    
    var sendend: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let start = "\(yearnum)/\(monthnum)/\(daynum) \(hournum):\(minutenum):\(secondnum)"
        let end = "\(sendend)"
        let startDate:NSDate? = dateFormatter.date(from: start) as NSDate?
        let endDate:NSDate? = dateFormatter.date(from: end) as NSDate?
        var components = cal.dateComponents(calUnit, from: startDate! as Date, to: endDate! as Date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
