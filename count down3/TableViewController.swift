//
//  TableViewController.swift
//  count down3
//
//  Created by 新井山詠斗 on 2017/06/21.
//  Copyright © 2017年 新井山詠斗. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexpath: NSIndexPath)->UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        return cell
    }
}
