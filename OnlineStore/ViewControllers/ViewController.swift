//
//  ViewController.swift
//  OnlineStore
//
//  Created by Берлинский Ярослав Владленович on 04.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets for ViewController

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    // MARK: Funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        print(DATABASE.count)
    }
}

extension ViewController {
    func setUpElements(){
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(logInButton)
    }
}
