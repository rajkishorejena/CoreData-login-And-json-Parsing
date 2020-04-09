//
//  ProfileViewController.swift
//  FirstAsignment
//
//  Created by Jovial on 2/29/20.
//  Copyright © 2020 Rajkishore. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userMaiId: UILabel!
    @IBOutlet weak var userContactNumber: UILabel!
    
    var strName : String!
    var strMail : String!
    var strPhone : String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        navigationItem.backBarButtonItem?.isEnabled = true

        userName.text = "Name:\(strName!)"
        userMaiId.text = "Mail:\(strMail!)"
        userContactNumber.text = "Number:\(strPhone!)"

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
     }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false

     }
//    override func viewWillAppear(_ animated: Bool) {
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(), style: .plain, target: self, action: nil)
//      }
    
    
    @IBAction func cellViewButton(_ sender: Any) {
        let tableVC = self.storyboard?.instantiateViewController(identifier: "TableViewController") as! TableViewController
        self.navigationController?.pushViewController(tableVC, animated: true)
    }
    
    @IBAction func signOutButton(_ Sender: Any) {
        let logVC = self.storyboard?.instantiateViewController(withIdentifier: "homeView") as! ViewController
        self.navigationController?.pushViewController(logVC, animated: true)
    }
    

}
