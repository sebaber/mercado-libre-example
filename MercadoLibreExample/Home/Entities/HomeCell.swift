//
//  HomeCell.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 24/04/2023.
//

import Foundation
enum HomeCellType {
    case search
    case item
}

struct HomeCell {
    var identifier: String
    var type: HomeCellType
}
