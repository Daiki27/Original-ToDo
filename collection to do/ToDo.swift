//
//  ToDo.swift
//  todo raealm sample
//
//  Created by 樋口大樹 on 2017/05/07.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import UIKit
import RealmSwift

class ToDo: Object {
    
    dynamic var id: Int = 0
    dynamic var title: String = ""
    dynamic var detailDescription: String = ""
    dynamic var createdAt: NSDate = NSDate()
    dynamic var dueDate: NSDate = NSDate()
    dynamic var isDone: Int = 0 // 0なら未完了、1なら完了
    
    // idをプライマリーキーに設定
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func lastId() -> Int {
        
        let realm = try! Realm()
        if let todo = realm.objects(ToDo.self).sorted(byKeyPath: "id", ascending: false).first {
            
            return todo.id + 1
        } else {
            
            return 1
        }
    }
}
