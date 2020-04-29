//
//  NewsViewModelProtocol.swift
//  testTask
//
//  Created by thisdjango on 29.04.2020.
//  Copyright © 2020 thisdjango. All rights reserved.
//

import Foundation

protocol NewsViewModelProtocol {
    
    var onGetting: (()->Void)? { get set }
    
    func grabData()
    
    var newsModel: NewsModel? { get set }

}
