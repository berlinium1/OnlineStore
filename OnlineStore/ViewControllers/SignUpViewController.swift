//
//  SignUpViewController.swift
//  OnlineStore
//
//  Created by Берлинский Ярослав Владленович on 04.05.2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextFieid: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    var person = Account()
    var delegate: ViewControllerDelegate?
    
    func setUpElements() {
        errorLabel.alpha = 0
        Utilities.styleTextField(firstNameTextFieid)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        guard ((firstNameTextFieid.text) != "") &&
                (passwordTextField.text != "") &&
                (emailTextField.text != "") else {
            errorMessage(title: "Ooops!", message: "Please, fill all the fields")
            return
        }
        person.name = firstNameTextFieid.text ?? ""; firstNameTextFieid.text = ""
        person.surname = lastNameTextField.text ?? ""; lastNameTextField.text = ""
        person.email = emailTextField.text ?? ""; emailTextField.text = ""
        person.password = passwordTextField.text ?? ""; passwordTextField.text = ""
        delegate?.updateDataBase(person: person)
        performSegue(withIdentifier: "fromRegisterToHome", sender: nil)
    }
}


extension SignUpViewController {
    private func errorMessage(title: String, message: String, textField: UITextField? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){
            _ in textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
