//
//  ProfileView.swift
//  Navigation
//
//  Created by Mihail on 27.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    private var statusText: String?

    private let avatar: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "cat"))
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 120/2
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Normal Cat"
        label.textColor = .black
        label.font.withSize(18)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.font.withSize(14)
        return label
    }()
    
    private let statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.font?.withSize(15)
        textField.textColor = .black
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(avatar)
        
        let constraints = [
            avatar.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatar.widthAnchor.constraint(equalToConstant: 12),
            avatar.heightAnchor.constraint(equalToConstant: 12)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func buttonPressed() {
        print(statusLabel.text!)
        statusLabel.text = statusText
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        if (textField.text != "") {
            statusText = textField.text!
        } else {
            statusText = "Waiting for something..."
        }
    }
}
