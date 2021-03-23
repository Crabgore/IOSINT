//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
//    let post: Post = Post(title: "Пост")
    
    private lazy var fButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(redButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var sButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(greenButtonPressed), for: .touchUpInside)
        return button
    }()

    private let mView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupViews()
        print(type(of: self), #function)
    }
    
    private func setupViews() {
        mView.addSubview(fButton)
        mView.addSubview(sButton)
        
        view.addSubview(mView)
        
        let constraints = [
            mView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            mView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            mView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            mView.heightAnchor.constraint(equalToConstant: 144),
            
            fButton.topAnchor.constraint(equalTo: mView.topAnchor, constant: 12),
            fButton.leadingAnchor.constraint(equalTo: mView.leadingAnchor),
            fButton.trailingAnchor.constraint(equalTo: mView.trailingAnchor),
            
            sButton.leadingAnchor.constraint(equalTo: mView.leadingAnchor),
            sButton.trailingAnchor.constraint(equalTo: mView.trailingAnchor),
            sButton.bottomAnchor.constraint(equalTo: mView.bottomAnchor, constant: -12)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func redButtonPressed() {
        let post = PostViewController()
        navigationController?.pushViewController(post, animated: true)
    }
    
    @objc private func greenButtonPressed() {
        let info = InfoViewController()
        navigationController?.pushViewController(info, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(type(of: self), #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(type(of: self), #function)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "post" else {
            return
        }
        guard let postViewController = segue.destination as? PostViewController else {
            return
        }
//        postViewController.post = post
    }
}
