//
//  LogInViewController.swift
//  OnlineStore
//
//  Created by Берлинский Ярослав Владленович on 04.05.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: Outlets for LogInViewController

    @IBOutlet weak var GetPasswordButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    // MARK: Functions and Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    


    @IBAction func logInTapped() {
        guard emailTextField.text != "" && passwordTextField.text != ""
        else {
            errorLabel.alpha = 1
            errorLabel.text = "Please, fill all the fields"
            //errorMessage(title: "Ooops!", message: "Please, fill all the fields")
            return
        }
        errorLabel.alpha = 0
        // checking if given information is true
        if isDataMatches(email: emailTextField.text!, password: passwordTextField.text!) {
            errorLabel.alpha = 0
            print("Done!")
            clearFields()
            performSegue(withIdentifier: "loginedSuccessfully", sender: nil)
            dismiss(animated: true, completion: nil)
        }
        else{
            errorLabel.alpha = 1
            errorLabel.text = "Incorrect email or password"
        }
    }

    }

extension LogInViewController: UITextFieldDelegate {
    
    func setUpElements () {
        errorLabel.alpha = 0
        Utilities.styleHollowButton(GetPasswordButton)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(logInButton)
    }
    
    private func errorMessage(title: String, message: String, textField: UITextField? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){
            _ in textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // checking for correct email and password
    private func isDataMatches(email: String, password: String) -> Bool{
        print(DATABASE.count)
        for i in 0..<DATABASE.count {
            if DATABASE[i].email == email {
                if DATABASE[i].password == password {
                        return true
                    }
                }
            }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            logInTapped()
        }
        return true
    }
    private func clearFields(){
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
}
