//
//  ViewControllerFirst.swift
//  count down3
//
//  Created by 新井山詠斗 on 2017/02/01.
//  Copyright © 2017年 新井山詠斗. All rights reserved.
//

import UIKit

class ViewControllerFirst: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    let numOfDays = 7
    let cellMargin : CGFloat = 2.0
    var datemanager: DateManager!
    @IBOutlet weak var calenderCollectionView: UICollectionView!
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerTitle2: UILabel!
    let dateformatter = DateFormatter()
    
    var mister: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        datemanager = DateManager()
        calenderCollectionView.delegate = self
        calenderCollectionView.dataSource = self
        headerTitle.text = datemanager.CalendarHeader2()
        headerTitle2.text = datemanager.CalendarHeader()
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector(("didSwipe")))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector(("didSwipe")))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){
            return numOfDays
        }else{
            return datemanager.daysAcquisition()
        }
    }
    
    final func didSwipe(sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            print("Right")
        }
        else if sender.direction == .left {
            print("Left")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalenderViewCell", for: indexPath) as! CalenderViewCell
        if(indexPath.section == 0){
            cell.backgroundColor = UIColor.green
            cell.textLabel.text = weekArray[indexPath.row]
            
        }else{
            cell.backgroundColor = UIColor.white
            cell.textLabel.text = datemanager.conversionDateFormat(index: indexPath.row)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        headerTitle.text = datemanager.CalendarHeader2()
        headerTitle2.text = datemanager.CalendarHeader()
        dateformatter.locale = Locale(identifier: "ja_JP")
        dateformatter.timeStyle = .none
        dateformatter.dateStyle = .full
        let iphone = datemanager.currentdayback(index: indexPath.row)
        
        let alert: UIAlertController = UIAlertController(title: "確認", message: "\(dateformatter.string(from: iphone))でよろしいですか？", preferredStyle:  UIAlertControllerStyle.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
            self.mister = self.dateformatter.string(from: iphone)
            self.performSegue(withIdentifier: "send", sender: nil)
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler:{
            
            (action: UIAlertAction!) -> Void in
        })

        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
        print("Num：\(datemanager.conversionDateFormat(index: indexPath.row)) Section:\(indexPath.section)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "send"{
            let viewcontroller2 = segue.destination as! ViewController2
            viewcontroller2.date = self.mister
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfMargin:CGFloat = 8.0
        let widths:CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin)/CGFloat(numOfDays)
        let heights:CGFloat = widths * 0.8
        
        return CGSize(width:widths,height:heights)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0.0 , 0.0 , 0.0 , 0.0 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    //前月ボタン
    @IBAction func prevMonthBtn(_ sender: UIButton) {
        datemanager.preMonthCalendar()
        calenderCollectionView.reloadData()
        headerTitle2.text = datemanager.CalendarHeader()
    }
    
    //次月ボタン
    @IBAction func nextMonthBtn(_ sender: UIButton) {
        datemanager.nextMonthCalendar()
        calenderCollectionView.reloadData()
        headerTitle2.text = datemanager.CalendarHeader()
    }
}
