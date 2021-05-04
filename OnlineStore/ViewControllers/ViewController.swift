//
//  ViewController.swift
//  OnlineStore
//
//  Created by Берлинский Ярослав Владленович on 04.05.2021.
//

import UIKit

protocol ViewControllerDelegate {
    func updateDataBase(person: Account)
}


class ViewController: UIViewController, ViewControllerDelegate {
    
    func updateDataBase(person: Account) {
        dataBase.accounts.append(person)
        print("Ready\n")
        print(dataBase.accounts)
        var counter = 0
        for i in 0..<dataBase.accounts.count {
            counter += 1
            print(" n: \(dataBase.accounts[i].name)")
        }
//        var count = 0
//        for i in dataBase.accounts {
//            count += 1
//            print("\(count)) n: \(i.name)")
//        }
    }
    

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    var dataBase = DataBase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let SignUpVC = segue.destination as? SignUpViewController {
            //dataBase.accounts.append(SignUpVC.person)
            SignUpVC.delegate = self
            for i in dataBase.accounts {
                print("Name: \(i.name)")
            }
        }
    }
    
    func setUpElements(){
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(logInButton)
        
    }

}

