//
//  ThirdViewController.swift
//  Animations
//
//  Created by Harshvirsinh Parmar on 06/12/21.
//

import UIKit

class ThirdViewController: UIViewController {
    fileprivate let imageView = UIImageView(image: UIImage(named: "send"))

    override func viewDidLoad() {
        super.viewDidLoad()
    view.addSubview(imageView)
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true

    imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true

   

    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 38

    let card =  UIView()
    imageView.addSubview(card)

    card.translatesAutoresizingMaskIntoConstraints = false

    card.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    card.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    card.heightAnchor.constraint(equalToConstant: 150).isActive = true

    card.widthAnchor.constraint(equalToConstant: 200).isActive = true

    card.backgroundColor = UIColor.black.withAlphaComponent(0.50)
   
        card.isUserInteractionEnabled = false

        imageView.isUserInteractionEnabled = true

        imageView.addGestureRecognizer (UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture)))
        }

        @objc func handlePanGesture(gesture:UIPanGestureRecognizer) {

        if gesture.state == .began {
            //imageView.transform = CGAffineTransform(scaleX: 2, y: 2)

        } else if gesture.state == .changed {

        let translation = gesture.translation (in: self.view)

            imageView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
      //      imageView.transform = CGAffineTransform(scaleX: <#T##CGFloat#>, y: <#T##CGFloat#>)

        }else if gesture.state == .ended {
          //  imageView.transform =   CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate (withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseIn, animations: { self.imageView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)

        })
        }
        }
}
