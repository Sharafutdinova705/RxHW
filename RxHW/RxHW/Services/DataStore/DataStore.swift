//
//  DataStore.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 14/11/2019.
//  Copyright © 2019 Гузель Шарафутдинова. All rights reserved.
//

import Foundation

public class DataStore {
    let users: [User] = [
        User(login: "A", password: "1", urlRequest: .planets),
        User(login: "B", password: "2", urlRequest: .starships),
        User(login: "C", password: "3", urlRequest: .vehicles)
    ]
}
