//
//  ItemViewCell.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 24/04/2023.
//

import Foundation
import UIKit

class ItemViewCell: UITableViewCell {
    
    static let identifier = "ItemViewCell"
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    func setData(item: Item){
        titleLabel.text = item.title
        priceLabel.text = "$\(item.price)"
        UIHelper.loadImageAsync(imageView: self.itemImageView, url: URL(string: item.thumbnail))
    }
}
