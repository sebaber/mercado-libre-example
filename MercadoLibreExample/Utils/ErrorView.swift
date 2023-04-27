//
//  ErrorView.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 25/04/2023.
//

import Foundation
import UIKit

class ErrorView: UIView {
    
    static let shared = ErrorView()
    
    private let errorLabel = UILabel()
    private let actionButton = UIButton(type: .system)
    
    typealias ButtonAction = () -> Void
    private var action: ButtonAction? = nil
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        errorLabel.font = UIFont.boldSystemFont(ofSize: 17)
        errorLabel.textColor = .red
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = 0
        addSubview(errorLabel)
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        errorLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        actionButton.backgroundColor = .systemBlue
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        actionButton.layer.cornerRadius = 8
        actionButton.clipsToBounds = true
        addSubview(actionButton)
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.widthAnchor.constraint(equalToConstant: 283).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        actionButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48).isActive = true
    }
    
    func showError(message: String) {
        errorLabel.text = message
        actionButton.isHidden = true
        
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
    
    func showError(message: String, buttonTitle: String? = nil, action: (() -> Void)? = nil) {
        errorLabel.text = message
        actionButton.isHidden = false
        
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
        
        self.action = action
        if (self.action != nil) {
            actionButton.setTitle(buttonTitle, for: .normal)
            actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        }
    }
    
    @objc private func actionButtonTapped() {
        self.action?()
    }
}

extension UIViewController {
    
    func topMostViewController() -> UIViewController {
        if let presentedViewController = presentedViewController {
            return presentedViewController.topMostViewController()
        }
        if let navigationController = self as? UINavigationController {
            return navigationController.visibleViewController?.topMostViewController() ?? self
        }
        if let tabBarController = self as? UITabBarController {
            return tabBarController.selectedViewController?.topMostViewController() ?? self
        }
        return self
    }
    
}


