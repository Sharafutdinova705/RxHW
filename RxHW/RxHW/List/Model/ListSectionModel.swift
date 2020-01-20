//
//  ListSectionModel.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 16/01/2020.
//  Copyright © 2020 Гузель Шарафутдинова. All rights reserved.
//

import Foundation
import RxDataSources

public struct ListSectionModel: AnimatableSectionModelType {
    
    public typealias Item = ListCell
    public typealias Identity = String
    public var identity: String
    public var items: [ListCell]
    
    public init(original: ListSectionModel, items: [ListCell]) {
        self = original
        self.items = items
    }
    
    public init(identity: String, items: [Item]) {
        self.identity = identity
        self.items = items
    }
}

public class ListCell: IdentifiableType, Equatable {
    public var identity: String = ""
    public typealias Identity = String
    
    public static func == (lhs: ListCell, rhs: ListCell) -> Bool {
        return lhs.identity == rhs.identity
    }
    
    init(identity: String) {
        self.identity = identity
    }
}
