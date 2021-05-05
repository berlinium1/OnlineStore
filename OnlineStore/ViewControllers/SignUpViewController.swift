//
//  SignUpViewController.swift
//  OnlineStore
//
//  Created by Берлинский Ярослав Владленович on 04.05.2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: Outlets for SignUpViewController
    
    @IBOutlet weak var firstNameTextFieid: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    // MARK: Funcs and Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextFieid.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        setUpElements()
    }
    
    @IBAction func signUpTapped() {
        // checking whether all the necessary text fields were filled
        guard emailTextField.text != "" && passwordTextField.text != "" else {
            errorLabel.alpha = 1
            errorLabel.text = "You didn't fill email field or password field"
            //errorMessage(title: "Ooops!", message: "Please, fill all the fields")
            return
        }
        errorLabel.alpha = 0
        // checking whether password is valid
        if !Utilities.isPasswordValid(passwordTextField.text!) {
            errorMessage(title: "WARNING", message: "You enetered inappropriate password")
            return
        }
        // checking whether email is valid
        if !Utilities.isValidEmail(possibleEmail: emailTextField.text!) {
            errorMessage(title: "WARNING", message: "You entered inappropriate mail or it already exists")
            return
        }
        let person = Account(name: firstNameTextFieid.text!, surname: lastNameTextField.text!, password: passwordTextField.text!, email: emailTextField.text!)
        clearFields()
        DATABASE.append(person) // adding new person to DataBase
        performSegue(withIdentifier: "GoHome", sender: nil) // going to Home Screen
        dismiss(animated: true, completion: nil)
    }
    
}


extension SignUpViewController: UITextFieldDelegate {
    
    //setting up style for buttons & text fields
    func setUpElements() {
        errorLabel.alpha = 0
        Utilities.styleTextField(firstNameTextFieid)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    // function that is calling error
    private func errorMessage(title: String, message: String, textField: UITextField? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){
            _ in textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // clear text fields
    private func clearFields(){
        firstNameTextFieid.text = ""
        lastNameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    // func for hiding a keyboard after tapping out of keyboard area
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // func for moving cursor to the next text field / action
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
