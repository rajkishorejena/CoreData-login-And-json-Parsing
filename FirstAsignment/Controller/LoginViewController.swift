//
//  LoginViewController.swift
//  FirstAsignment
//
//  Created by Jovial on 2/29/20.
//  Copyright © 2020 Rajkishore. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var employee: [Employee]? = [Employee]()
    var isLoginSuccess = false
    @IBOutlet weak var emailidTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        employee =  DatabaseHelper.shareIntance.gateData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
     }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false

     }

    @IBAction func loginButton(_ sender: Any) {
        let logEmail = emailidTextField.text!
        let logPassword = passwordTextField.text!
        if self.validateCredentials(){
        if let employeeArray = employee {
//            print(employeeArray)
            for eachEmployee in employeeArray {

//                print("\n")
//                print(eachEmployee.email!)
//                print(eachEmployee.password!)
//                print("\n")

                let  gateMail = eachEmployee.email!
                let gataPassword = eachEmployee.password!
                let gateName = eachEmployee.name!
                let  gatePhone = eachEmployee.phone!

                if logEmail == gateMail && logPassword == gataPassword {
                    self.isLoginSuccess = true
                    self.transferVC(userDetails: User(name: gateName, email: gateMail, phone: gatePhone))
                 } else {
                    continue;
                }
            }
            if !isLoginSuccess {
                presentAlert(title: "LoginErro", message: "Try Again")
            }
        }
    }
    }
    private func transferVC(userDetails user: User) {
        let profileVC = self.storyboard?.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        profileVC.strName = user.name
        profileVC.strMail = user.email
        profileVC.strPhone = user.phone
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    private func validateCredentials() -> Bool {
        print("within")
        if let username = emailidTextField.text, let password = passwordTextField.text {
            guard username != "" && password != "" && username != " " && password != " " else {
                presentAlert(title: "Login Error", message: "username or password cant be empty")
                return false
            }
            guard username.count >= 3 else { presentAlert(title: "Sign-in Error", message: "username most be greater than 2 characters") ; return false }
            guard password.count >= 5 else {
                presentAlert(title: "Sign-in Error", message: "password most be greater than 4 Characters")
                return false
            }
            return true
        }
        return false
    }
    
    private func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
