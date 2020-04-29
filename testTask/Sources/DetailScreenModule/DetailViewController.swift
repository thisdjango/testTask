//
//  DetailViewController.swift
//  testTask
//
//  Created by thisdjango on 29.04.2020.
//  Copyright © 2020 thisdjango. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data: Value? {
        didSet {
            if let data = data {
                titleNews.label.text = data.joke.uppercased()
            }
        }
    }
    
    // MARK: - private props
    private var imageNews = ImageNewsView()
    
    private var titleNews = TitleNewsView()
    
    private var author = AuthorView()
    
    private var date = DateView()
    
    private var commentButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "Shape"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var commentNumber: UILabel = {
        var label = UILabel()
        label.text = "3"
        label.font = UIFont(name: "PTRootUI-Regular", size: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Статья"
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(imageNews)
        view.addSubview(titleNews)
        view.addSubview(author)
        view.addSubview(date)
        view.addSubview(commentButton)
        view.addSubview(commentNumber)
        
        titleNews.label.font = UIFont(name: "PTRootUI-Medium", size: 28)
        
        author.heightAnchor.constraint(equalToConstant: 20).isActive = true
        author.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        author.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        date.heightAnchor.constraint(equalToConstant: 20).isActive = true
        date.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        date.leadingAnchor.constraint(equalTo: author.trailingAnchor, constant: 18).isActive = true
        
        commentButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        commentButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        commentButton.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: 18).isActive = true
        
        commentNumber.heightAnchor.constraint(equalToConstant: 20).isActive = true
        commentNumber.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        commentNumber.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 6).isActive = true
        
        titleNews.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 8).isActive = true
        titleNews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        titleNews.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        imageNews.heightAnchor.constraint(equalToConstant: 195).isActive = true
        imageNews.topAnchor.constraint(equalTo: titleNews.bottomAnchor, constant: 24).isActive = true
        imageNews.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageNews.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}
