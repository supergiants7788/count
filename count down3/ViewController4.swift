//
//  ViewController3.swift
//  count down3
//
//  Created by 新井山詠斗 on 2016/12/03.
//  Copyright © 2016年 新井山詠斗. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
    @IBOutlet weak var label1: UILabel!
    var text1: String = ""
    @IBOutlet weak var label2: UILabel!
    var text2: String = ""
    @IBOutlet weak var label3: UILabel!
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            label1.text = text1
            label2.text = text2
            label3.text = name
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        let newmatter = Time()
        newmatter.title = name
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newmatter)
                print("Matter Saved")
            })
        }catch{
            print("Save is Faild")
        }
        self.performSegue(withIdentifier: "countdown", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "countdown"{
            let viewcontroller5 = segue.destination as! ViewController5
            viewcontroller5.text1 = self.text1
            viewcontroller5.text2 = self.text2
            viewcontroller5.name = self.name
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
