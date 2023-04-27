//
//  NoResultsView.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 27/04/2023.
//

import Foundation
import UIKit

class NoResultsView: UIView {
    
    static let shared = NoResultsView()
    
    private let imageView = UIImageView(image: UIImage(named: "lupa"))
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        
        
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 128).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 128).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 14)
        descriptionLabel.textColor = .gray
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        addSubview(descriptionLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    func showNoResults(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        
        if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            // Replace the currently displayed view controller with the error view
            if let topViewController = keyWindow.rootViewController?.topMostViewController() {
                let containerView = topViewController.view!
                containerView.addSubview(self)
                
                translatesAutoresizingMaskIntoConstraints = false
                topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
                leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
                trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
                bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            }
        }
    }
    
    func hideError() {
        removeFromSuperview()
    }
}

