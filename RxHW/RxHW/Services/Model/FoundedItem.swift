//
//  FoundedItem.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 20/01/2020.
//  Copyright © 2020 Гузель Шарафутдинова. All rights reserved.
//

import Foundation

struct FoundedItem {
    
    var title: String
    var description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}

extension FoundedItem {
    
    /// Инициализация с помощью json
    ///
    /// - Parameter JSON: json в виде словаря
    init?(requestType: RequestType, JSON: [String:AnyObject]) {
        self.title = JSON[requestType.fields.first ?? ""] as? String ?? ""
        self.description = JSON[requestType.fields.last ?? ""] as? String ?? ""
    }
}
