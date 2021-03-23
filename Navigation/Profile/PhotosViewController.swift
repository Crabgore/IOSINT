//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Mihail on 03.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    let photos = [Photos(image: #imageLiteral(resourceName: "file-20200803-24-50u91u")),
                  Photos(image: #imageLiteral(resourceName: "_109474861_angrycat-index-getty3-3")),
                  Photos(image: #imageLiteral(resourceName: "c827782e12851cd2cf4c5161c4f5445a")),
                  Photos(image: #imageLiteral(resourceName: "p_blackwidow_19075_0fd5159b")),
                  Photos(image: #imageLiteral(resourceName: "owning-a-white-cat-5b1b91a318ba9-1024x683")),
                  Photos(image: #imageLiteral(resourceName: "2db9ef5eec0f57f5b9dbc4930f1faf2a")),
                  Photos(image: #imageLiteral(resourceName: "67586673")),
                  Photos(image: #imageLiteral(resourceName: "bad-boys-for-life-poster_1588197524")),
                  Photos(image: #imageLiteral(resourceName: "d6ba52ea3640dda6086f3ddb2d0c408b")),
                  Photos(image: #imageLiteral(resourceName: "aqCXTNCYOPOJ1ra5XEyeLqte58IAvUyDbNarHLTF")),
                  Photos(image: #imageLiteral(resourceName: "john-tecuceanu-1557217-unsplash-1024x683")),
                  Photos(image: #imageLiteral(resourceName: "1800x1200_cat_relaxing_on_patio_other")),
                  Photos(image: #imageLiteral(resourceName: "a83044fa51bb93b0d8cd8230213ebd87")),
                  Photos(image: #imageLiteral(resourceName: "witcher")),
                  Photos(image: #imageLiteral(resourceName: "The_SpongeBob_Movie_3_-_It's_a_Wonderful_Sponge_(poster)")),
                  Photos(image: #imageLiteral(resourceName: "1917_PosterArt")),
                  Photos(image: #imageLiteral(resourceName: "76940605")),
                  Photos(image: #imageLiteral(resourceName: "021520_catallergies_main-800x450")),
                  Photos(image: #imageLiteral(resourceName: "file-20200803-24-50u91u")),
                  Photos(image: #imageLiteral(resourceName: "football")),
                  Photos(image: #imageLiteral(resourceName: "kids-movies-2019-how-to-train-your-dragon-1543261100"))
    ]
    
    private let cellSize = CGSize(width: 100, height: 100)
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // default is .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        title = "Photo Gallery"
        
        view.addSubview(collectionView)
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotosCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PhotosCollectionViewCell
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    var inset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - inset * 4) / 3, height: (collectionView.frame.width - inset * 4) / 3)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return inset
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let photoCell = cell as? PhotosCollectionViewCell else { return }
        photoCell.photos = photos[indexPath.item]
    }
}
