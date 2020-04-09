//
//  ViewController.swift
//  FirstAsignment
//
//  Created by Jovial on 2/27/20.
//  Copyright © 2020 Rajkishore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var singup: UIView!
    @IBOutlet weak var login: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func RadioButton(_ sender: Any) {
        
        if (sender as AnyObject).selectedSegmentIndex == 0 {
                    login.alpha = 1
                    singup.alpha = 0
                } else {
                    login.alpha = 0
                    singup.alpha = 1
                }    }
        
    }
    


