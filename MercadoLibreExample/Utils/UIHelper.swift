//
//  UIHelper.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 26/04/2023.
//

import Foundation
import UIKit

class UIHelper {
    
    static func loadImageAsync(imageView: UIImageView, url: URL?){
        if let url = url {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        imageView.image = image
                    } else {
                        imageView.image = UIImage(named: "no-image")
                    }
                }
            }.resume()
        }
    }
    
    static func addShadow(backgroundView: UIView, foregroundView: UIView){
        foregroundView.layer.cornerRadius = 8.0
        foregroundView.layer.borderWidth = 1.0
        foregroundView.layer.borderColor = UIColor.clear.cgColor
        foregroundView.layer.shadowColor = UIColor.black.cgColor
        foregroundView.layer.shadowOpacity = 0.2
        foregroundView.layer.shadowOffset = CGSize(width: 0, height: 2)
        foregroundView.layer.shadowRadius = 4
        foregroundView.layer.masksToBounds = false

        backgroundView.layer.shadowColor = UIColor.black.cgColor
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        backgroundView.layer.shadowRadius = 2.0
        backgroundView.layer.shadowOpacity = 0.5
        backgroundView.layer.masksToBounds = false
        backgroundView.layer.shadowPath = UIBezierPath(roundedRect: backgroundView.bounds, cornerRadius: foregroundView.layer.cornerRadius).cgPath
    }
    
    static func setDefaultFlowLayour(collectionView: UICollectionView){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10 // horizontal spacing between cells
        flowLayout.minimumLineSpacing = 10 // vertical spacing between cells
        let cellsPerRow: CGFloat = 3 // number of cells per row
        let padding: CGFloat = 10 // padding between cells and collection view edges
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cellWidth = (collectionView.frame.width - 20 - (padding * 2) - (flowLayout.minimumInteritemSpacing * (cellsPerRow - 1))) / cellsPerRow
        let cellHeight = cellWidth // assuming cells have square aspect ratio
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.collectionViewLayout = flowLayout
    }
    
}
