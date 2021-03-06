//
//  HouseViewController.swift
//  collection to do
//
//  Created by 樋口大樹 on 2017/05/13.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import UIKit
import RealmSwift

class HouseViewController: UIViewController {
    
    @IBOutlet var distance: UILabel!
    
    var todoes: Results<ToDo> = {
        
        let realm = try! Realm()
        let count = realm.objects(ToDo.self).filter("isDone == 1")
        return count
    }()
    
    //画面の起動時に一度のみ呼び出されるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
        distance.text = String(todoes.count * 10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modoru(){
        self.dismiss(animated: true, completion: nil)
    }

}
