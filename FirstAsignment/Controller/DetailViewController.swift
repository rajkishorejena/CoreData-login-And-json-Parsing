//
//  DetailViewController.swift
//  FirstAsignment
//
//  Created by Rajkishore on 01/03/20.
//  Copyright © 2020 Rajkishore. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var empId: UILabel!
    @IBOutlet weak var empName: UILabel!
    @IBOutlet weak var empSalary: UILabel!
    @IBOutlet weak var empAge: UILabel!
    
    
    
    var myid = ""
    var myname  = ""
    var mysalary = ""
    var myage = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        empId.text = myid
        empName.text = myname
        empSalary.text = mysalary
        empAge.text = myage
        
        navigationItem.backBarButtonItem?.isEnabled = true
        // Do any additional setup after loading the view.
    }
    
     override func viewWillAppear(_ animated: Bool) {
         navigationController?.isNavigationBarHidden = true
      }
     
     override func viewWillDisappear(_ animated: Bool) {
         navigationController?.isNavigationBarHidden = false

      }
  
     @IBAction func signOutButton(_ Sender: Any) {
         let logVC = self.storyboard?.instantiateViewController(withIdentifier: "homeView") as! ViewController
         self.navigationController?.pushViewController(logVC, animated: true)
     }
}
