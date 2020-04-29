//
//  NewsTableViewCell.swift
//  testTask
//
//  Created by thisdjango on 25.04.2020.
//  Copyright © 2020 thisdjango. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static var reuseIdentifier = "newsCell"
    
    var news: Value? {
        didSet {
            if let news = news {
                titleNews.label.text = news.joke.uppercased()
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - private funcs
    private func configureUI() {
        selectionStyle = .none
        addSubview(imageNews)
        addSubview(titleNews)
        addSubview(author)
        addSubview(date)
        addSubview(commentButton)
        addSubview(commentNumber)
        
        imageNews.heightAnchor.constraint(equalToConstant: 195).isActive = true
        imageNews.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageNews.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageNews.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        titleNews.topAnchor.constraint(equalTo: imageNews.bottomAnchor, constant: 16).isActive = true
        titleNews.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleNews.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        author.heightAnchor.constraint(equalToConstant: 20).isActive = true
        author.topAnchor.constraint(equalTo: titleNews.bottomAnchor, constant: 8).isActive = true
        author.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        author.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -36).isActive = true
        
        date.heightAnchor.constraint(equalToConstant: 20).isActive = true
        date.topAnchor.constraint(equalTo: titleNews.bottomAnchor, constant: 8).isActive = true
        date.leadingAnchor.constraint(equalTo: author.trailingAnchor, constant: 18).isActive = true
        date.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -36).isActive = true
        
        commentButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        commentButton.topAnchor.constraint(equalTo: titleNews.bottomAnchor, constant: 8).isActive = true
        commentButton.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: 18).isActive = true
        commentButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -36).isActive = true
        
        commentNumber.heightAnchor.constraint(equalToConstant: 20).isActive = true
        commentNumber.topAnchor.constraint(equalTo: titleNews.bottomAnchor, constant: 8).isActive = true
        commentNumber.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 6).isActive = true
        commentNumber.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -36).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
