//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Mihail on 16.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let posts = [Post(author: "Danny",
                      description: "New Dune Photos",
                      image: "dune-2020",
                      likes: 53,
                      views: 103),
                 Post(author: "Diane",
                      description: "That was a good sunday",
                      image: "vocation",
                      likes: 13,
                      views: 23),
                 Post(author: "Sam",
                      description: "Just finished Witcher. AWESOME!!!",
                      image: "witcher",
                      likes: 66,
                      views: 98),
                 Post(author: "Matvey",
                      description: "Noice match!",
                      image: "football",
                      likes: 42,
                      views: 84)
    ]
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let background = UIView()
    private let close = UIButton()
    private lazy var header = ProfileHeaderView()
    private lazy var tableHeader = ProfileTableHederView()
    private lazy var image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupViews()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: String(describing: PostTableViewCell.self)
        )
        tableView.register(
            PhotosTableViewCell.self,
            forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        tableView.register(
            ProfileTableHederView.self,
            forHeaderFooterViewReuseIdentifier: String(describing: ProfileTableHederView.self)
        )
    }
    
    @objc func avatarTap(gestureRecognizer: UITapGestureRecognizer) {
        print("tapped")
        self.close.layer.opacity = 0
        
        isAnimating = true
        UIView.animateKeyframes(withDuration: 0.8, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.7) {
//                if let image = gestureRecognizer.view! as? UIImageView {
                    self.background.backgroundColor = .black
                    self.background.layer.opacity = 0.5
                    self.background.translatesAutoresizingMaskIntoConstraints = false
                    self.image.translatesAutoresizingMaskIntoConstraints = false

                    self.view.addSubview(self.background)
                    self.view.addSubview(self.image)
       

                    let constraints = [
                        self.background.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                        self.background.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                        self.background.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                        self.background.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),

                        self.image.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                        self.image.heightAnchor.constraint(equalTo: self.image.widthAnchor),
                        self.image.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                        self.image.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    ]

                    NSLayoutConstraint.activate(constraints)
                    self.image.layoutIfNeeded()
//                }
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3) {
                let closeImage = UIImage(contentsOfFile: "SF_clear_fill")
                self.close.translatesAutoresizingMaskIntoConstraints = false
                self.close.setImage(closeImage, for: [])
                
                self.background.addSubview(self.close)
                
                let constraints = [
                    self.close.topAnchor.constraint(equalTo: self.background.topAnchor),
                    self.close.trailingAnchor.constraint(equalTo: self.background.trailingAnchor),
                    self.close.widthAnchor.constraint(equalToConstant: 50),
                    self.close.heightAnchor.constraint(equalToConstant: 50)
                ]

                NSLayoutConstraint.activate(constraints)

                self.close.layer.opacity = 1
            }
        }, completion: { finished in
            isAnimating = false
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.closeTap))
            self.close.addGestureRecognizer(recognizer)
        })
    }
    
    @objc func closeTap(gestureRecognizer: UITapGestureRecognizer) {
        print("tapped")
        
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.background.layer.opacity = 0
                self.header.layoutSubviews()
            }
        }, completion: { finished in
            self.image.removeFromSuperview()
            self.tableHeader.setupViews()
            self.background.removeFromSuperview()
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.avatarTap))
            self.tableHeader.profileHeaderView.imageView.addGestureRecognizer(recognizer)
        })
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
            cell.post = posts[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer for section: \(section)"
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 250
        } else {
            return .zero
        }

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ProfileTableHederView.self)) as! ProfileTableHederView
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(avatarTap))
            headerView.profileHeaderView.imageView.addGestureRecognizer(recognizer)
            self.header = headerView.profileHeaderView
            self.image = headerView.profileHeaderView.imageView
            self.tableHeader = headerView
            
            return headerView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: true)
        }
    }

}
