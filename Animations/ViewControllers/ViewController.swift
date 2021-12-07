//
//  ViewController.swift
//  Animations
//
//  Created by Harshvirsinh Parmar on 06/12/21.
//

import UIKit

class ViewController: UIViewController {
    var currentAnimation = 0
    @IBOutlet var planeImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapbtn(_ sender: UIButton) {
        sender.isHidden = true
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            switch self.currentAnimation{
            case 0:
                self.planeImage.transform = CGAffineTransform(scaleX: 2, y: 2)
//                self.planeImage.layer.shadowColor = UIColor.black.cgColor
//                self.planeImage.layer.shadowRadius = 2
//                self.planeImage.layer.borderColor = UIColor.black.cgColor
//                self.planeImage.layer.borderWidth = 2
            case 1:
                self.planeImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            case 2:
                self.planeImage.transform = .identity
            case 3:
                self.planeImage.transform = CGAffineTransform(scaleX: 0, y: 0)
            default:
                break
            }
        }) {finished in
            sender.isHidden = false
        }

        currentAnimation += 1
        if currentAnimation > 7{
            currentAnimation = 0
        }
    }
    
}

