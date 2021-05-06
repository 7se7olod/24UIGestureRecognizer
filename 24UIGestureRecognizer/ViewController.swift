//
//  ViewController.swift
//  24UIGestureRecognizer
//
//  Created by Всеволод on 05.05.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        labelText.text = "Gesture Recognizer"
        labelText.textColor = .white
        swipeObservers()
        tapObservers()
    }

    @IBOutlet weak var labelText: UILabel!
    
    func swipeObservers() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(headerSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(headerSwipes))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(headerSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(headerSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }

    func tapObservers() {
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapAction))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.require(toFail: tripleTap)
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func headerSwipes(gester: UISwipeGestureRecognizer) {
        switch gester.direction {
        case .right:
            labelText.text = "Swipe Right"
            view.backgroundColor = .black
        case .left:
            labelText.text = "Swipe Left"
            view.backgroundColor = .brown
        case .up:
            labelText.text = "Swipe Up"
            view.backgroundColor = .green
            labelText.textColor = .blue
        case .down:
            labelText.text = "Swipe Down"
            view.backgroundColor = .orange
        default:
            break
        }
    }
    
    @objc func tripleTapAction() {
        labelText.text = "Triple Tap"
    }
    
    @objc func doubleTapAction() {
        labelText.text = "Double Tap"
    }
}
