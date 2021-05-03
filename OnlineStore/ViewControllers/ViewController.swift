//
//  ViewController.swift
//  OnlineStore
//
//  Created by Берлинский Ярослав Владленович on 04.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    
    func setUpElements(){
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(logInButton)
        
    }

}

