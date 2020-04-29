//
//  ImageNewsView.swift
//  testTask
//
//  Created by thisdjango on 29.04.2020.
//  Copyright © 2020 thisdjango. All rights reserved.
//

import UIKit

class ImageNewsView: UIView {
    
    var image: UIImageView = {
        var imV = UIImageView()
        imV.image = UIImage(named: "Rectangle")
        imV.contentMode = .scaleAspectFill
        imV.translatesAutoresizingMaskIntoConstraints = false
        return imV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
