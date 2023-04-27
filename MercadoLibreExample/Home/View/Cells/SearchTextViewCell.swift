//
//  SearchTextViewCell.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 24/04/2023.
//

import UIKit

class SearchTextViewCell: UITableViewCell {
    
    @IBOutlet weak var searchLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setSearch(search: String) {
        self.searchLabel.text = search
    }
}
