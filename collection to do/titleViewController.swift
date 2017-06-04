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
    
    @IBAction func toHouseView(){
        
        //todoes.count・・・完了したタスクの数
        print(todoes.count)
        
        let amari = todoes.count % 8
        print(amari)
        
        switch amari {
        case 0:
            self.performSegue(withIdentifier: "toHouseView", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "toHouseView2", sender: nil)
        case 2:
            self.performSegue(withIdentifier: "toHouseView3", sender: nil)
        case 3:
            self.performSegue(withIdentifier: "toHouseView4", sender: nil)
        case 4:
            self.performSegue(withIdentifier: "toHouseView5", sender: nil)
        case 5:
            self.performSegue(withIdentifier: "toHouseView6", sender: nil)
        case 6:
            self.performSegue(withIdentifier: "toHouseView7", sender: nil)
        case 7:
            self.performSegue(withIdentifier: "toHouseView8", sender: nil)
        default:
            break
        }
//        if todoes.count == 1{
//        self.performSegue(withIdentifier: "toHouseView", sender: nil)
//        } else if todoes.count == 2 {
//            self.performSegue(withIdentifier: "toHouseView2", sender: nil)
//        } else {
//            self.performSegue(withIdentifier: "toHouseView", sender: nil)
//        }
    }

}
