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
        
        print("keke")

       
    }
    
    @IBAction func loginClick(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != ""{
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { data , error in
                if error != nil{
                    self.makeAlert(title: "Error", message: error!.localizedDescription)
                } else{
                    if let user = data?.user {
                        if user.isEmailVerified{
                            self.performSegue(withIdentifier: "homePG", sender: nil)
                        }else{
                            self.makeAlert(title: "Email Verification Error!", message: "Please confirm the account verification link sent to your e-mail.")
                        }
                    }
                   
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
