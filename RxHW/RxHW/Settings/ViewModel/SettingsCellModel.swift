//
//  SettingsCellModel.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 21/01/2020.
//  Copyright © 2020 Гузель Шарафутдинова. All rights reserved.
//

import Foundation
import UIKit

public class SettingsCellModel {
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
