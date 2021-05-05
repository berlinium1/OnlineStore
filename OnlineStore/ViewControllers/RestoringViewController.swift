//
//  RemindingViewController.swift
//  OnlineStore
//
//  Created by Берлинский Ярослав Владленович on 05.05.2021.
//

import UIKit

class RemindingViewController: UIViewController {

    // MARK: Outlets for RemindingViewController
    
    @IBOutlet weak var restoringTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    // MARK: Functions and Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleTextField(restoringTextField)
        Utilities.styleFilledButton(doneButton)
        //message(title: "Password Recovery", message: "Write in Your full name or email")
    }
    
    // showing a password as a result
    @IBAction func doneButtonPressed() {
        guard restoringTextField.text != "" && restoringTextField != nil else {
            message(title: "Ooops", message: "Enter your full name or email")
            return
        }
        var flag = false
        for account in DATABASE {
            if (account.name + " " + account.surname) == restoringTextField.text || account.email == restoringTextField.text {
                message(title: "Current Password", message: "Your password is: \(account.password)")
                flag = true
            }
        }
        if !flag {
            message(title: "Ooops", message: "There's no user with such credentials")
        }
    }
    
}

extension RemindingViewController {
    private func message(title: String, message: String, textField: UITextField? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){
            _ in textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
