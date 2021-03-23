//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Mihail on 16.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

var isAnimating: Bool = false

class ProfileHeaderView: UIView {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "cat"))
    private let profileLabel = UILabel()
    private let statusLabel = UILabel()
    private let profileButton = UIButton(type: .system)
    private let textField = UITextField()
    private var statusText: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        setupAvater()
        
        addSubview(profileLabel)
        setupNameLabel()
        
        addSubview(statusLabel)
        setupStatusLabel()
        
        addSubview(profileButton)
        setupButton()
        
        addSubview(textField)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAvater() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 120/2
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.isUserInteractionEnabled = true
    }
    
    private func setupNameLabel() {
        profileLabel.text = "Normal Cat"
        profileLabel.textColor = .black
        profileLabel.font.withSize(18)
        profileLabel.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    private func setupStatusLabel() {
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .gray
        statusLabel.font.withSize(14)
    }
 
    private func setupButton() {
        profileButton.backgroundColor = .blue
        profileButton.setTitle("Show status", for: .normal)
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.layer.cornerRadius = 4
        profileButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        profileButton.layer.shadowRadius = 4
        profileButton.layer.shadowColor = UIColor.black.cgColor
        profileButton.layer.shadowOpacity = 0.7
        profileButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    private func setupTextField() {
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.font?.withSize(15)
        textField.textColor = .black
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !isAnimating {
            imageView.frame = CGRect(x: 16, y: safeAreaInsets.top + 16, width: 120, height: 120)
            profileLabel.frame = CGRect(x: 152, y: safeAreaInsets.top + 27, width: 200, height: 50)
            statusLabel.frame = CGRect(x: 152, y: imageView.frame.maxY - 50, width: 200, height: 50)
            profileButton.frame = CGRect(x: 16, y: textField.frame.maxY + 16, width: frame.width - 32, height: 50)
            textField.frame = CGRect(x: 152, y: statusLabel.frame.maxY, width: frame.width - 168, height: 40)
        }
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
