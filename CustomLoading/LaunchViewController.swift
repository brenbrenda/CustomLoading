//
//  LaunchViewController.swift
//  CustomLoading
//
//  Created by chia on 2021/3/22.
//

import UIKit
import AVFoundation

class LaunchViewController: UIViewController {

    var timer: Timer?
    let player = AVPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileURL = Bundle.main.url(forResource: "bighero6", withExtension: "mov")!
        let playerItem = AVPlayerItem(url: fileURL)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        let imageView = UIImageView(frame: CGRect(x: 5, y: 300, width: 480, height: 270))
        view.addSubview(imageView)
        var images = [UIImage]()
        for i in 0...14 {
            images.append(UIImage(named: "baymax-\(i)")!)
        }
        imageView.animationImages = images
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = 11
        imageView.image = images.last
        imageView.startAnimating()

//        let animatedImage = UIImage.animatedImageNamed("baymax-", duration: 0.5)
//        imageView.image = animatedImage
        timer = Timer.scheduledTimer(withTimeInterval: 7, repeats: false, block: { (_) in
                   self.performSegue(withIdentifier: "BayMax", sender: " ")
               })

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let _ = segue.destination as! UIViewController
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


