//
//  ItemDetailProductTableViewCell.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 26/04/2023.
//

import UIKit

class ItemDetailProductTableViewCell: UITableViewCell {

    static let identifier = "ItemDetailProductTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(item: Item){
        self.titleLabel.text = item.title
        UIHelper.loadImageAsync(imageView: self.productImage, url: URL(string: item.thumbnail))
        self.priceLabel.text = "$\(item.price)"
    }
}
