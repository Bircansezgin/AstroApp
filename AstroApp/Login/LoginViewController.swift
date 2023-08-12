//
//  LoginViewController.swift
//  AstroApp
//
//  Created by Bircan Sezgin on 12.08.2023.
//

import UIKit
import Firebase
import FirebaseAuth
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func loginClick(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != ""{
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { data , error in
                if error != nil{
                    self.makeAlert(title: "Error", message: error!.localizedDescription)
                } else{
                    self.makeAlert(title: "Success", message: "You Have Entered Succesfully")
                }
            }
        }else{
            makeAlert(title: "Error", message: "bos birakmayin")
        }
    }
    
    
    
    
    
    
    func makeAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okbuttun = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okbuttun)
        self.present(alert, animated: true)
    }
    
    
    
}
