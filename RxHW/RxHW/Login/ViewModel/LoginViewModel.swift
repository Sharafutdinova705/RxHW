//
//  LoginViewModel.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 14/11/2019.
//  Copyright © 2019 Гузель Шарафутдинова. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

public class LoginViewModel {
    
    let dataStore: DataStore = DataStore()
    var emailText = BehaviorRelay<String>(value: "")
    var passwordText = BehaviorRelay<String>(value: "")
    var isValid: Observable<Bool>{
        return Observable.zip(emailText.asObservable(), passwordText.asObservable()) { email, password in
            return self.dataStore.users.contains(where: { user in
                user.login == email && user.password == password
            })
        }
    }
}
