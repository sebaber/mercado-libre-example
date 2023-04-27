//
//  CategoryCollectionViewCell.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 25/04/2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    var id: String = ""

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var contentStackView: UIView!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UIHelper.addShadow(backgroundView: self, foregroundView: self.contentView)
    }
    
    
    func setData(category: CategoryResult){
        self.id = category.id
        self.categoryLabel.text = category.name
        self.categoryImage.image = UIImage(named: category.id) ?? UIImage(named: "MLA1403")
    }
    
}
