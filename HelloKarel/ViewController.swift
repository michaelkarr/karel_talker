//
//  ViewController.swift
//  HelloKarel
//
//  Created by Michael Karr on 2/14/17.
//  Copyright © 2017 Michael Karr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backflipButton: UIButton!
    @IBOutlet weak var karelText: UITextView!
    @IBOutlet weak var karelImage: UIImageView!
    @IBOutlet weak var talkField: UITextField!
    
    let welcomeMessage = "Talk to Karel!"
    
    let responses : [String : String] = [
        "Hello" : "Hi!",
        "How are you?" : "Doing great!"
    ]

    @IBAction func doBackflip(sender: AnyObject) {
        karelImage.rotate360Degrees()
        karelText.text = "Yay!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        karelText.text = "Talk to me!"
        talkField.placeholder = welcomeMessage
        
        //talkField.text = welcomeMessage
        //talkField.text = "Talk to Karel!"
        
        //class in charge of handling text field
        talkField.delegate = self
        
        //backflipButton.addTarget(self, action: @selector(self.doBackflip), forControlEvents: touchupInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UITextFieldDelegate
{
    
    // this would run and replace our given text
    
    /*func textFieldDidBeginEditing(textField: UITextField) {
        //if user taps the text field first time, clear the text field
        if (textField.text == welcomeMessage) {
            textField.text = ""
        }

    }*/
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false;
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        //if let: if assignment is non-null value, perform first block of code
        if let karelRespone = responses[textField.text!] {
            karelText.text = karelRespone
        } else {
            karelText.text = "No comment"
        }
    }
}

//from Andrew Bancroft: https://www.andrewcbancroft.com/2014/10/15/rotate-animation-in-swift/
extension UIView {
    func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = duration
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate
        }
        self.layer.addAnimation(rotateAnimation, forKey: nil)
    }
}

