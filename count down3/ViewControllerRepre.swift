//
//  ViewControllerRepre.swift
//  count down3
//
//  Created by 新井山詠斗 on 2017/06/28.
//  Copyright © 2017年 新井山詠斗. All rights reserved.
//

import UIKit

class ViewControllerRepre: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var peter: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        let nib = UINib(nibName: "ViewControllerList", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "LISTCELL")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ViewControllerList = tableView.dequeueReusableCell(withIdentifier: "LISTCELL") as! ViewControllerList
        cell.titleLabel.text = peter
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
