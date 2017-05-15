//
//  ListCollectionViewController.swift
//  collection to do
//
//  Created by 樋口大樹 on 2017/05/08.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"

class ListCollectionViewController: UICollectionViewController, CellDelegate  {
    
    var todoes: Results<ToDo> = {

        let realm = try! Realm()
        let count = realm.objects(ToDo.self).filter("isDone == 0")
        return count
    }()
    
    //セルの個数を返すメソッド
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section : Int) -> Int
    {
        return todoes.count;
    }
    
    //データを返すメソッド。セルの中身の表示の仕方の設定。
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell //セルの再利用
        cell.delegate = self
        cell.titleLabel.text = todoes[indexPath.row].title
        return cell
        
    }
    
    //起動時に一回の処理
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        //collectionviewからcellが使えるようにする。
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: "Cell")
        
    }
    
    //-ボタンを押した時の処理。
    func delete(cell: CollectionViewCell) {
        
        
        // IndexPathを取得
        let indexPath = self.collectionView?.indexPath( for: cell )
        
        //isDoneに１を代入
        do{
            let realm = try Realm() //defaultのRealmを取得
            try realm.write {
                todoes[(indexPath?.row)!].isDone = 1
            } } catch {
                print(error)
        }
    
        
        loadView()
        viewDidLoad()
    }
    
    
    //警告を受け取ったときに呼ばれるメソッド
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //collectionviewのセクションの数を決定する
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 1
    }
    
    //別の画面でなにか情報が更新され、ビューが戻った際にそれを反映するためのメソッド
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    //タップされた時に呼び出されるメソッド
    override func collectionView(_ collectionView: UICollectionView,  didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "toDetail", sender: todoes[indexPath.row])
    }
    
    //タップした時にラベルに保存されたデータを表示する。
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
            if segue.identifier == "toDetail" {
                let controller = segue.destination as! DetailViewController
                if let todo = sender as? ToDo {
                    controller.todo = todo
                }
            }
    }
    
    //戻る処理
    @IBAction func modoru(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //＋ボタンを押した時のメソッド
    @IBAction func add() {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
    }
    

}
