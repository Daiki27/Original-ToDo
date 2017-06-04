//
//  House2ViewController.swift
//  collection to do
//
//  Created by 樋口大樹 on 2017/05/14.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import UIKit
import RealmSwift

class House2ViewController: UIViewController {

    @IBOutlet var distance: UILabel!
    
    var collectionView: UICollectionView!
    
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
//    
//    @IBAction func reset(cell: CollectionViewCell){
//        
////        let indexPath = self.collectionView?.indexPath( for: cell )
//        
//        // realmデータ削除
//        do{
//            let realm = try Realm()
//            try realm.write {
//                realm.deleteAll()
//            } } catch {
//                print(error)
//        }
//
//    }

}
