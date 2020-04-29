//
//  TitleNewsView.swift
//  testTask
//
//  Created by thisdjango on 29.04.2020.
//  Copyright © 2020 thisdjango. All rights reserved.
//

import UIKit

class TitleNewsView: UIView {
    
    var label: UILabel = {
       var label = UILabel()
        label.font = UIFont(name: "PTRootUI-Medium", size: 20)
        print(label.font.fontName)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
