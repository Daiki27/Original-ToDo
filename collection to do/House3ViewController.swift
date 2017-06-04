//
//  House3ViewController.swift
//  collection to do
//
//  Created by 樋口大樹 on 2017/05/16.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import UIKit
import RealmSwift

class House3ViewController: UIViewController {

    @IBOutlet var distance: UILabel!
    
    var todoes: Results<ToDo> = {
        
        let realm = try! Realm()
        let count = realm.objects(ToDo.self).filter("isDone == 1")
        return count
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
distance.text = String(todoes.count * 10)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modoru(){
        self.dismiss(animated: true, completion: nil)
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
