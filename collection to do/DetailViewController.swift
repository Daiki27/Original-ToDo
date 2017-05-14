//
//  DetailViewController.swift
//  todo raealm sample
//
//  Created by 樋口大樹 on 2017/05/07.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var todo: ToDo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        descriptionTextField.delegate = self
        
        if let todo = self.todo {
            titleTextField.text = todo.title
            descriptionTextField.text = todo.detailDescription
            dueDatePicker.date = todo.dueDate as Date
        }
    }
    
    @IBAction func save() {
        //duedateは常にデータがあるからif let 使わない。
        if let title = titleTextField.text, let detailDescription = descriptionTextField.text, let dueDate: Date = dueDatePicker.date  {
            
            let todo = ToDo()
            todo.id = ToDo.lastId()
            todo.title = title
            todo.detailDescription = detailDescription
            todo.dueDate = dueDate as NSDate
            
            let realm = try! Realm()
            try! realm.write {
                
                realm.add(todo)
            }
            
            print(Realm.Configuration.defaultConfiguration.fileURL?.absoluteString ?? "")
        }
        
        //saveボタンを押した時のメッセージ
        let alert = UIAlertController(
            title: "保存完了",
            message: "単語の準備が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title:"OK",
            style: .default,
            handler: nil
        ))
        self.present(alert, animated:true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
