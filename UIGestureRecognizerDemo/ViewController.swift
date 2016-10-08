//
//  ViewController.swift
//  UIGestureRecognizerDemo
//
//  Created by Administrator on 08.10.16.
//  Copyright © 2016 VSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var image: UIImageView!
    
    var tapGesture: UITapGestureRecognizer!
    var doubleTapGesture: UITapGestureRecognizer!
    var rotationGesture: UIRotationGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap(_:)))
        tapGesture.delegate = self
        doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.didDoubleTap(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        // privet poka
        rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.didRotate(_:)))
        // poka privet
        // my fancy change
        let swipe = UISwipeGestureRecognizer()
        image.addGestureRecognizer(tapGesture)
        image.addGestureRecognizer(rotationGesture)
        image.addGestureRecognizer(doubleTapGesture)
        
    }

    
    func didTap(_ recognizer: UITapGestureRecognizer) {
        print("did tap")
    }
    
    func didDoubleTap(_ recognizer: UITapGestureRecognizer) {
        print("did double tap")
    }
    
    func didRotate(_ recognizer: UIRotationGestureRecognizer) {
        image.transform = image.transform.rotated(by: recognizer.rotation)
        recognizer.rotation = 0.0
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if let g1 = gestureRecognizer as? UITapGestureRecognizer,
            let g2 = otherGestureRecognizer as? UITapGestureRecognizer {
            if g1.numberOfTapsRequired < g2.numberOfTapsRequired {
                return true
            }
        }
        
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

