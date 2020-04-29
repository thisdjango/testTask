//
//  NewsViewModel.swift
//  testTask
//
//  Created by thisdjango on 29.04.2020.
//  Copyright © 2020 thisdjango. All rights reserved.
//

import Foundation
import Moya

class NewsViewModel: NewsViewModelProtocol {
    
    var onGetting: (() -> Void)?
    
    var newsModel: NewsModel?
    
    private let provider = MoyaProvider<NewsTarget>()
    
    var dataSource: [Value]? {
        newsModel?.value ?? []
    }
    
    func grabData() {
        _ = provider.rx.request(.newsGet)
            .filterSuccessfulStatusCodes()
            .subscribe { [weak self] event in
                switch event {
                case let .success(response):
                    guard let model = try? response.map(NewsModel.self) else { return }
                    self?.newsModel = model
                    self?.onGetting?()
                case .error:
                    print(event)
                    self?.onGetting?()
                }
            }
    }
}
