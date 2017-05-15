//
//  titleViewController.swift
//  collection to do
//
//  Created by 樋口大樹 on 2017/05/13.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import UIKit
//import AVFoundation

class titleViewController: UIViewController {
    
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
        
//        countlabel.text = String("風船")
        
//        show()
        
    }
//    
//    func show(){
//        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate //AppDelegateのインスタンスを取得
//        let Count = appDelegate.kakunou
//        countlabel.text = String(describing: Count)
//    }
//    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func toListView(){
        self.performSegue(withIdentifier: "toListView", sender: nil)
    }
    
    @IBAction func toHouseView(){
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate //AppDelegateのインスタンスを取得
        let Count = appDelegate.kakunou
        
        print(Count!)
        
        if Count == 0 || Count == 1{
        self.performSegue(withIdentifier: "toHouseView", sender: nil)
        } else if Count == 2 {
            self.performSegue(withIdentifier: "toHouseView2", sender: nil)
        } else {
            self.performSegue(withIdentifier: "toHouseView", sender: nil)
        }
    }

}
