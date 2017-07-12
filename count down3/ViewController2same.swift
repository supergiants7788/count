//
//  ViewController2same.swift
//  count down3
//
//  Created by 新井山詠斗 on 2016/12/06.
//  Copyright © 2016年 新井山詠斗. All rights reserved.
//

import UIKit

class ViewController2same: UIViewController {
    @IBOutlet weak var label1: UILabel!
    var text1: String = ""
    @IBOutlet weak var label2: UILabel!
    var text2: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = text1
        label2.text = text2
    }
    
    @IBAction func checked() {
        self.performSegue(withIdentifier: "third", sender: nil)
    }
    
    @IBAction func timechange() {
        self.performSegue(withIdentifier: "back", sender: nil)
    }
    @IBAction func datechange() {
        self.performSegue(withIdentifier: "back2", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "third"{
            let viewcontroller3 = segue.destination as! ViewController3same
            viewcontroller3.text1 = self.text1
            viewcontroller3.text2 = self.text2
        }
        
        if segue.identifier == "back"{
            let viewcontroller3 = segue.destination as! ViewControllersame
            viewcontroller3.date2 = self.text1
//            viewcontroller3.text2 = self.text2
        }
        if segue.identifier == "back2"{
            let viewcontroller3 = segue.destination as! ViewControllerback
            viewcontroller3.music = self.text2
            //            viewcontroller3.text2 = self.text2
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
