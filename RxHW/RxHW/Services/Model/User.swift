//
//  User.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 14/11/2019.
//  Copyright © 2019 Гузель Шарафутдинова. All rights reserved.
//

import Foundation
import RxDataSources
import RxSwift
import RxCocoa

public struct User {
    public let login: String
    public let password: String
    public let urlRequest: RequestType
    
    public init(login: String, password: String, urlRequest: RequestType) {
        self.login = login
        self.password = password
        self.urlRequest = urlRequest
    }
}
