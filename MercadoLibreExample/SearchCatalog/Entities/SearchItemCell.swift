//
//  SearchItemCell.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 24/04/2023.
//

import Foundation
enum SearchItemCellType {
    case item
}

struct SearchItemCell {
    var identifier: String
    var type: SearchItemCellType
}
