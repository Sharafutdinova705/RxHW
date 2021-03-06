//
//  ListCellModel.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 16/01/2020.
//  Copyright © 2020 Гузель Шарафутдинова. All rights reserved.
//

import Foundation
import UIKit

public class ListCellModel {
    public let title: String
    public let description: String
    
    init(
        title: String,
        description: String
        ) {
        self.title = title
        self.description = description
    }
}
