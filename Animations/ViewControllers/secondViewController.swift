//
//  secondViewController.swift
//  Animations
//
//  Created by Harshvirsinh Parmar on 06/12/21.
//

import UIKit
import Lottie
class secondViewController: UIViewController {
    @IBOutlet var planeView: UIView!
    @IBOutlet var planeImg: UIImageView!
    let animationView = AnimationView()
   
    @IBOutlet var dustbin: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        planeImg.addSubview(planeView)
       planeView.layer.cornerRadius = 30
       planeView.clipsToBounds = true
       planeImg.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture)))
        letanimate()
        planeView.isUserInteractionEnabled = false
        planeImg.isUserInteractionEnabled = true
    }
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer){
        UIImageView.animate(withDuration: 0, delay: 0, options: [], animations: {
        if gesture.state == .began{
            self.planeImg.transform = CGAffineTransform(scaleX: 2, y: 2)
        }else if gesture.state == .changed{
            self.planeImg.transform = CGAffineTransform(scaleX: 1, y: 1)
        }else if gesture.state == .ended{
            self.planeImg.transform = CGAffineTransform(scaleX: 0, y: 0)
        }
    })
}
    func letanimate(){
        animationView.animation = Animation.named("dustbin")
        animationView.frame = dustbin.bounds
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.play()
            dustbin.addSubview(animationView)
}
}
    
