//
//  DateManager.swift
//  count down3
//
//  Created by 新井山詠斗 on 2017/02/01.
//  Copyright © 2017年 新井山詠斗. All rights reserved.
//

import UIKit

class DateManager: NSObject {
    var selectDay = Date()
    var selectDay2 = Date()
    var biginDay = Date()
    var endDay = Date()
    
    let calendar = Calendar.current
    
    func BeginOfMonthCalender() -> Date{
        var components = calendar.dateComponents([.year,.month,.day], from: selectDay)
        components.day = 1
        let firstOfMonth = Calendar.current.date(from: components)
        let dayOfWeek = calendar.component(.weekday,from:firstOfMonth!)
        return calendar.date(byAdding: .day, value: 1-dayOfWeek, to: firstOfMonth!)!
    }
    
    func BeginOfMonthCalender2() -> Date{
        var components = calendar.dateComponents([.year,.month,.day], from: selectDay2)
        components.day = 1
        let firstOfMonth = Calendar.current.date(from: components)
        let dayOfWeek = calendar.component(.weekday,from:firstOfMonth!)
        return calendar.date(byAdding: .day, value: 1-dayOfWeek, to: firstOfMonth!)!
    }
    
    func EndOfMonthCalendar() ->Date{
        let nextmonth = calendar.nextDate(after: selectDay, matching: DateComponents(day:1), matchingPolicy: Calendar.MatchingPolicy.nextTime)
        let dayOfWeek = calendar.component(.weekday,from: nextmonth!)
        return calendar.date(byAdding: .day, value: 7-dayOfWeek, to: nextmonth!)!
    }
    
    func EndOfMonthCalendar2() ->Date{
        let nextmonth = calendar.nextDate(after: selectDay2, matching: DateComponents(day:1), matchingPolicy: Calendar.MatchingPolicy.nextTime)
        let dayOfWeek = calendar.component(.weekday,from: nextmonth!)
        return calendar.date(byAdding: .day, value: 7-dayOfWeek, to: nextmonth!)!
    }
    
    func daysAcquisition() -> Int{
        biginDay = BeginOfMonthCalender()
        endDay = EndOfMonthCalendar()
        return calendar.dateComponents([.day], from:biginDay ,to:endDay).day! + 1
    }
    
    func conversionDateFormat(index: Int)->String{
        let currentday = calendar.date(byAdding: .day, value: index, to: biginDay)
        return calendar.component(.day, from: currentday!).description
    }
    
    func currentdayback(index: Int) -> Date {
        return calendar.date(byAdding: .day, value: index, to: biginDay)!
    }
    
    func CalendarHeader()->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY年/MM月"
        
        return formatter.string(from: selectDay)
    }
    
    func CalendarHeader2()->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY年/MM月dd日"
        
        return formatter.string(from: selectDay2)
    }
    
    func preMonthCalendar(){
        selectDay = calendar.date(byAdding: .month, value: -1, to: selectDay)!
    }
    
    func nextMonthCalendar(){
        selectDay = calendar.date(byAdding: .month, value: 1, to: selectDay)!
    }

    func preDayCalendar(){
        selectDay = calendar.date(byAdding: .day, value: -1, to: selectDay)!
    }
    
    func nextDayCalendar(){
        selectDay = calendar.date(byAdding: .day, value: 1, to: selectDay)!
    }
}
