//
//  User.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 14/11/2019.
//  Copyright © 2019 Гузель Шарафутдинова. All rights reserved.
//

import Foundation

public struct User {
    public let login: String
    public let password: String
    public let urlRequest: String
    
    public init(login: String, password: String, urlRequest: String) {
        self.login = login
        self.password = password
        self.urlRequest = urlRequest
    }
}
