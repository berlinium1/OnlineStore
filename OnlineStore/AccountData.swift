//
//  AccountData.swift
//  OnlineStore
//
//  Created by Берлинский Ярослав Владленович on 04.05.2021.
//

import Foundation

class Account {
    var name: String = ""
    var surname: String = ""
    var password: String = ""
    var email: String = ""
    
    init() {}
    
    
    init(name: String, surname: String, password: String, email: String) {
        self.name = name
        self.surname = surname
        self.password = password
        self.email = email
    }
}
