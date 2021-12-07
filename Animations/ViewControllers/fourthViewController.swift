//
//  fourthViewController.swift
//  Animations
//
//  Created by Harshvirsinh Parmar on 06/12/21.
//

import UIKit
import Lottie
import AVFoundation
class fourthViewController: UIViewController {
    var player: AVAudioPlayer!

    @IBOutlet var dustbinView: UIView!
    let animationView = AnimationView()
    @IBOutlet var planeImg: UIImageView!
    
    var mainPoint = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        planeImg.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture)))
         letanimate()
         planeImg.isUserInteractionEnabled = true
        letanimate()
        // Do any additional setup after loading the view.
    }
    @objc func handlePanGesture(gestureRecognizer:UIPanGestureRecognizer){
        if gestureRecognizer.state == .began {
            mainPoint = planeImg.center
            planeImg.transform = CGAffineTransform(scaleX: 0.5 ,y: 0.5)
            print("began")
        }else if gestureRecognizer.state == .changed {
            let translation = gestureRecognizer.translation(in: self.view)
            // note: 'view' is optional and need to be unwrapped
            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
//            let translation = gesture.translation(in: self.view)
//            planeImg.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        } else if gestureRecognizer.state == .ended {
            
            let x = dustbinView.center.x
            let y = dustbinView.center.y
            
            let iX = planeImg.center.x
            let iY = planeImg.center.y
            
            if ((x-50)<iX && (x+50)>iX) && ((y-50)<iY && (y+50)>iY) {
                planeImg.transform = CGAffineTransform(scaleX: 0.0 ,y: 0.0)
                playSound(soundName: "delete")
            } else {
                UIView.animate(withDuration: 1) {
                    self.planeImg.center = self.mainPoint
                    self.planeImg.transform = CGAffineTransform(scaleX: 1 ,y: 1)
                }
            }
            print("Ended")
        }
    }
    func letanimate(){
        animationView.animation = Animation.named("dustbin")
        animationView.frame = dustbinView.bounds
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.play()
            dustbinView.addSubview(animationView)
 

}
    func playSound(soundName: String) {
        
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
