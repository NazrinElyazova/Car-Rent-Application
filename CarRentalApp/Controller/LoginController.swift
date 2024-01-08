//
//  LoginController.swift
//  CarRentalApp
//
//  Created by Nazrin on 21.10.23.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var driveitLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var loginImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailText.layer.cornerRadius = 20
        passwordText.layer.cornerRadius = 20
        loginButton.layer.cornerRadius = 25
        login()
        
    }
    @IBAction func loginAction(_ sender: Any) {
        if emailText.text?.isEmpty == true || passwordText.text?.isEmpty == true {
            showAlert()
        } else {
            let controller = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
            navigationController?.show(controller, sender: nil)
        }
    }
    func showAlert() {
        let alertAction = UIAlertController(title: "You have no account. Please, register.", message: "", preferredStyle: .alert)
        alertAction.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertAction, animated: true)
    }
    func login() {
        UserDefaults.standard.set(true, forKey: "login")
    }
}
