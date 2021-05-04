//
//  DataBase.swift
//  OnlineStore
//
//  Created by Берлинский Ярослав Владленович on 04.05.2021.
//

import Foundation

class DataBase {
    var accounts = [Account]()
    
    init() {}
    
    init(account: Account) {
        self.accounts.append(account)
    }
}
