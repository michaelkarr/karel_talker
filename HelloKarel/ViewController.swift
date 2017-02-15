//
//  ViewController.swift
//  HelloKarel
//
//  Created by Michael Karr on 2/14/17.
//  Copyright © 2017 Michael Karr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var karelImage: UIImageView!
    @IBOutlet weak var karelText: UILabel!
    @IBOutlet weak var talkField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        karelText.text = "Talk to me!"
        //talkField.text = "Talk to Karel!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

