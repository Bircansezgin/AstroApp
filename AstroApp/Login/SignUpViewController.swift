//
//  SignUpViewController.swift
//  AstroApp
//
//  Created by Bircan Sezgin on 12.08.2023.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameSurnameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var passwordOneStep: UITextField!
    @IBOutlet weak var passwordTwoStep: UITextField!
    @IBOutlet weak var birthdayTimeOf: UITextField!
    
    
    let fireStoreDB = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    @IBAction func signUpClick(_ sender: Any) {
        if emailTextField.text != "" && nameSurnameTextField.text != "" && passwordOneStep.text != "" && passwordTwoStep.text != "" && birthdayTextField.text != "", birthdayTimeOf.text != ""{
            if passwordOneStep.text == passwordTwoStep.text{
                
                Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordOneStep.text!) { data, error in
                    if error != nil{
                        print(error!.localizedDescription)
                    }else{
                        //self.makeAlert(title: "Success", message: "Create User!")
                        
                        Auth.auth().currentUser?.sendEmailVerification(completion: { error in
                            if error != nil{
                                self.makeAlert(title: "Error", message: error!.localizedDescription)
                            }else{
                                self.makeAlert(title: "Succes", message: "KEVSER NAPAN KARDAS Send Email. Please Accept!")
                                let userInfoDic = ["username": self.nameSurnameTextField.text!, "Birthday Date": self.birthdayTextField.text!, "Birthday Time Of": self.birthdayTimeOf.text!, "Credit" : 20] as [String : Any]
                                self.fireStoreDB.collection("userData").addDocument(data: userInfoDic) { error in
                                    if error != nil{
                                        self.makeAlert(title: "Error Server", message: error!.localizedDescription)
                                    }else{
                                        print("userData Kaydedildi.")
                                    }
                                }
                            }
                        })
                    }
                }
                
                
            }else{
                self.makeAlert(title: "Error Password", message: "Not same")
            }
        }else{
            self.makeAlert(title: "Error ", message: "Please, Fill All Fields!")
        }
    }
    

    @IBOutlet weak var haveAccountClick: UILabel!
    
    
    func makeAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okbuttun = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okbuttun)
        self.present(alert, animated: true)
    }
    
}
