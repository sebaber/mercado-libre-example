//
//  LoadingView.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 25/04/2023.
//

import Foundation
import UIKit

class LoadingView: UIView {
    
    static let shared = LoadingView()
    
    private let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        activityIndicatorView.color = .white
        addSubview(activityIndicatorView)
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func startAnimating() {
        DispatchQueue.main.async {
            self.activityIndicatorView.startAnimating()
            UIApplication.shared.keyWindow?.addSubview(self)
            self.translatesAutoresizingMaskIntoConstraints = false
            self.topAnchor.constraint(equalTo: UIApplication.shared.keyWindow!.topAnchor).isActive = true
            self.leadingAnchor.constraint(equalTo: UIApplication.shared.keyWindow!.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: UIApplication.shared.keyWindow!.trailingAnchor).isActive = true
            self.bottomAnchor.constraint(equalTo: UIApplication.shared.keyWindow!.bottomAnchor).isActive = true
        }
    }
    
    func stopAnimating() {
        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
            self.removeFromSuperview()
        }
    }
    
}
