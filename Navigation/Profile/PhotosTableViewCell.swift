//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Mihail on 03.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let photoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "SF_arrowshape_turn_up_right_fill")
        imageView.tintColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let photosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubviews(photoLabel, arrowImageView, photosStackView)
        
        let imageOne = UIImageView(image: #imageLiteral(resourceName: "67586673"))
        imageOne.contentMode = .scaleAspectFit
        let imageTwo = UIImageView(image: #imageLiteral(resourceName: "c827782e12851cd2cf4c5161c4f5445a"))
        imageTwo.contentMode = .scaleAspectFit
        let imageThree = UIImageView(image: #imageLiteral(resourceName: "_109474861_angrycat-index-getty3-3"))
        imageThree.contentMode = .scaleAspectFit
        let imageFour = UIImageView(image: #imageLiteral(resourceName: "owning-a-white-cat-5b1b91a318ba9-1024x683"))
        imageFour.contentMode = .scaleAspectFit

        photosStackView.addArrangedSubview(imageOne)
        photosStackView.addArrangedSubview(imageTwo)
        photosStackView.addArrangedSubview(imageThree)
        photosStackView.addArrangedSubview(imageFour)

        
        let constraints = [
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowImageView.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            
            photosStackView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photosStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photosStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photosStackView.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}
