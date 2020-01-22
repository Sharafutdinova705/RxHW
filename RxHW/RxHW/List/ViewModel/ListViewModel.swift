//
//  ListViewModel.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 22/01/2020.
//  Copyright © 2020 Гузель Шарафутдинова. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public class ListViewModel {
    
    public var foundedItemSubject = BehaviorRelay<[ListCellModel]>(value: [])
    public var downloadedItemSubject = BehaviorRelay<[ListCellModel]>(value: [])
}
