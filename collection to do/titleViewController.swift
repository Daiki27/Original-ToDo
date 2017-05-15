//
//  titleViewController.swift
//  collection to do
//
//  Created by 樋口大樹 on 2017/05/13.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import UIKit
import RealmSwift
//import AVFoundation

class titleViewController: UIViewController {
    
    var todoes: Results<ToDo> = {
        
        let realm = try! Realm()
        let count = realm.objects(ToDo.self).filter("isDone == 1")
        return count
    }()
    
//    var audioPlayer : AVAudioPlayer!
    
//    var Count: Int = 0
    
//    @IBOutlet var countlabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        // 再生する audio ファイルのパスを取得
//        let soundFilePath = Bundle.main.path(forResource: "clap", ofType:"wav")!
//        let fileURL = URL(fileURLWithPath: soundFilePath)
//        
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
//            audioPlayer.numberOfLoops = -1
//            audioPlayer.prepareToPlay()
//            audioPlayer.play()
//        }catch{
//            print("音楽ファイルが読み込めませんでした")
//        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func toListView(){
        self.performSegue(withIdentifier: "toListView", sender: nil)
    }
    
    @IBAction func toHouseView(cell: CollectionViewCell){
        
        //todoes.count・・・完了したタスクの数

        print(todoes.count)
        
        if todoes.count == 1{
        self.performSegue(withIdentifier: "toHouseView", sender: nil)
        } else if todoes.count == 2 {
            self.performSegue(withIdentifier: "toHouseView2", sender: nil)
        } else {
            self.performSegue(withIdentifier: "toHouseView", sender: nil)
        }
    }

}
