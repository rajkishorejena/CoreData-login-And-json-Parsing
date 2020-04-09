//
//  SignupViewController.swift
//  FirstAsignment
//
//  Created by Jovial on 2/29/20.
//  Copyright © 2020 Rajkishore. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTxetField: UITextField!
    @IBOutlet weak var emailidTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var conformpasswordTextFielld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
    @IBAction func signupButton(_ sender: Any) {
        if self.validateCredentials() {
        let dict = ["name":nameTextField.text,"phone":phoneNumberTxetField.text,"email":emailidTextField.text,"password":passwordTextField.text]
            do {
                try DatabaseHelper.shareIntance.save(object: dict as! [String:String])
            } catch {
                print(error.localizedDescription)
            }
            let alertController = UIAlertController(title: "Sign-up successful", message: "please login to continue !", preferredStyle: .alert);
            let alertAction = UIAlertAction(title: "OK", style: .cancel) { [weak self] action in
                guard let self = self else { return }
                let logVC = self.storyboard?.instantiateViewController(identifier: "homeView") as! ViewController
                self.navigationController?.pushViewController(logVC, animated: true)
                   }
                 alertController.addAction(alertAction)
                  present(alertController, animated: true, completion: nil)
            
            }
      }



    private func validateCredentials() -> Bool {
           print("within")
        if let username = self.nameTextField.text,
           let password = self.passwordTextField.text,
            let phoneNumber = self.phoneNumberTxetField.text,
            let emaiId = self.emailidTextField.text,
            let confirmPassword = self.conformpasswordTextFielld.text

           {
              guard username != "" && password != ""  && phoneNumber != "" && emaiId != "" && confirmPassword != "" && username != " " && password != " " && phoneNumber != " " && emaiId != " " && confirmPassword != ""
               else {
                   presentAlert(title: "Sign-in Error", message: "You haven't filled out all the fields")
                   return false
               }
               guard username.count >= 3 else { presentAlert(title: "Sign-in Error", message: "username most be greater than 2 characters") ; return false }
             guard password.count >= 5 else { presentAlert(title: "Sign-in Error", message: "password most be greater than 4 characters") ; return false }
//           guard password != confirmPassword else { presentAlert(title: "Sign-in Error", message:                 "password don't match") ; return false }
            guard phoneNumber.count == 10 else {
                   presentAlert(title: "Sign-in Error", message: "phoneNumber most be greater than 10 Characters")
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
