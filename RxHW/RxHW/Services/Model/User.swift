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
    public var identity: String = ""
    public let login: String
    public let password: String
    public let urlRequest: RequestType
    
    public init(login: String, password: String, urlRequest: RequestType) {
        self.login = login
        self.password = password
        self.urlRequest = urlRequest
    }
}

extension User: IdentifiableType, Equatable {
    public typealias Identity = String
    
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.identity == rhs.identity
    }
    
    init(identity: String, login: String, password: String, urlRequest: RequestType) {
        self.identity = identity
        self.login = login
        self.password = password
        self.urlRequest = urlRequest
    }
}
