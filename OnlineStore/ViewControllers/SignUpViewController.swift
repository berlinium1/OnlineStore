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
        firstNameTextFieid.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        setUpElements()
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
        Utilities.styleTextField(firstNameTextFieid)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    @IBAction func signUpTapped() {
        guard firstNameTextFieid.text != "" && emailTextField.text != "" && passwordTextField.text != "" else {
            errorMessage(title: "Ooops!", message: "Please, fill all the fields")
            return
        }
        if !Utilities.isPasswordValid(passwordTextField.text!) {
            errorMessage(title: "WARNING", message: "Password is wrong type")
            return
        }
        if !Utilities.isValidEmail(testStr: emailTextField.text!) {
            errorMessage(title: "WARNING", message: "Email is wrong type")
            return
        }
        let person = Account(name: firstNameTextFieid.text!, surname: lastNameTextField.text!, password: passwordTextField.text!, email: emailTextField.text!)
        clearFields()
        DATABASE.append(person)
        performSegue(withIdentifier: "GoHome", sender: nil)
        dismiss(animated: true, completion: nil)
    }
    
}


extension SignUpViewController: UITextFieldDelegate {
    private func errorMessage(title: String, message: String, textField: UITextField? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){
            _ in textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func clearFields(){
        firstNameTextFieid.text = ""
        lastNameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameTextFieid:
            firstNameTextFieid.resignFirstResponder()
            lastNameTextField.becomeFirstResponder()
        case lastNameTextField:
            lastNameTextField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
        case emailTextField:
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
            signUpTapped()
        default:
            signUpTapped()
        }
        return true
    }
}
