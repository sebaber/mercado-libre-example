//
//  ItemDetailCell.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 26/04/2023.
//

import Foundation
enum ItemDetailCellType {
    case product
}

struct ItemDetailCell {
    var identifier: String
    var type: ItemDetailCellType
}
