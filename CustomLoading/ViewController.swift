//
//  ViewController.swift
//  CustomLoading
//
//  Created by chia on 2021/3/22.
//

import UIKit
import AVFoundation
import SpriteKit


class ViewController: UIViewController {

    let player = AVPlayer()
    @IBOutlet weak var RateTextField: UITextField!
    @IBOutlet weak var BayMax: UIImageView!
    @IBOutlet weak var ShowTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileURL = Bundle.main.url(forResource: "mood", withExtension: "mov")!
        let playerItem = AVPlayerItem(url: fileURL)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        // Do any additional setup after loading the view.
        //let rate: Int = Int(RateTextField.text)
        
    }
    @IBAction func PainTextField(_ sender: Any) {


        
        guard let Pain = Int(RateTextField.text!) else { return  }
        if Pain <= 5 {
            BayMax.isHidden = false
            ShowTextView.text = "you are good"
            //skView.isPaused = true
            
        } else if Pain > 5 {
            BayMax.isHidden = true
            ShowTextView.text = "Recovering..."
            let skView = SKView(frame: view.frame)
            view.insertSubview(skView, at: 0)
            let scene = SKScene(size: skView.frame.size)
            scene.anchorPoint = CGPoint(x: 0.5, y: 1)
            let emitterNode = SKEmitterNode(fileNamed: "MyParticle")
            scene.addChild(emitterNode!)
            skView.presentScene(scene)
            
            //skView.isPaused = false
        }
    }
    
    @IBAction func MinimizeKeyButton(_ sender: Any) {
        view.endEditing(true)
    }

}



