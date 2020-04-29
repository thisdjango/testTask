//
//  DateView.swift
//  testTask
//
//  Created by thisdjango on 29.04.2020.
//  Copyright © 2020 thisdjango. All rights reserved.
//

import UIKit

class DateView: UIView {

    var label: UILabel = {
           var label = UILabel()
           label.text = "23 мая в 13:50"
           label.font = UIFont(name: "PTRootUI-Regular", size: 12)
           label.textColor = .gray
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
