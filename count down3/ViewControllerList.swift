//
//  ViewControllerList.swift
//  count down3
//
//  Created by 新井山詠斗 on 2017/06/28.
//  Copyright © 2017年 新井山詠斗. All rights reserved.
//

import UIKit

class ViewControllerList: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myItems = [String]()
    var tokyo: String = ""
    @IBOutlet weak var tableView: UITableView!
    let ud = UserDefaults.standard
    
    var text1: String = ""
    var text2: String = ""
    
    var times = [String]()
    
    var timer: Timer!
    
    var end: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        ud.removeObject(forKey: "scoresKey")
//        ud.removeObject(forKey: "scoresKey2")
        
        if ud.object(forKey: "scoresKey") != nil {
            myItems = ud.object(forKey: "scoresKey") as! [String]
        }
        if ud.object(forKey: "scoresKey2") != nil {
            times = ud.object(forKey: "scoresKey2") as! [String]
        }
        if tokyo == "" {
        }else{
            myItems.append("\(tokyo)")
        }
        if end == "" {
        }else{
            times.append("\(end)")
        }
        tableView.delegate = self
        tableView.dataSource = self
        ud.set(myItems, forKey: "scoresKey")
        ud.synchronize()
        ud.set(times, forKey: "scoresKey2")
        ud.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.accessoryType = .detailButton
        cell.textLabel?.text = "\(myItems[indexPath.row])"
        cell.detailTextLabel?.text = ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルがタップされた時の処理
        print("タップされたセルのindex番号: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // アクセサリボタン（セルの右にあるボタン）がタップされた時の処理
        print("タップされたアクセサリがあるセルのindex番号: \(indexPath.row)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "counting"{
            let viewcontrollerresult = segue.destination as! ViewControllerResult
            viewcontrollerresult.sendend = self.end
            
        }
    }
}
