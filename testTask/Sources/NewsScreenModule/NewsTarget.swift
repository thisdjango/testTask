//
//  NewsTarget.swift
//  testTask
//
//  Created by thisdjango on 29.04.2020.
//  Copyright © 2020 thisdjango. All rights reserved.
//

import Foundation
import Moya
import Alamofire

public enum NewsTarget {
  // 1
  case newsGet
}

extension NewsTarget: TargetType {
    private var parameterEncoding: ParameterEncoding {
        JsonArrayEncoding.default
    }

    public var baseURL: URL {
        return URL(string: "http://api.icndb.com/")!
    }

    public var path: String {
        switch self {
        case .newsGet: return "/jokes"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .newsGet: return .get
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        return .requestPlain // TODO
    }

    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    public var validationType: ValidationType {
        return .successCodes
        
    }
}

struct JsonArrayEncoding: Moya.ParameterEncoding {
    static var `default`: JsonArrayEncoding { JsonArrayEncoding() }
    
    /// Creates a URL request by encoding parameters and applying them onto an existing request.
    ///
    /// - parameter urlRequest: The request to have parameters applied.
    /// - parameter parameters: The parameters to apply.
    ///
    /// - throws: An `AFError.parameterEncodingFailed` error if encoding fails.
    ///
    /// - returns: The encoded request.
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var req = try urlRequest.asURLRequest()
        if let dic = parameters {
            let json = try JSONSerialization.data(
                withJSONObject: dic,
                options: JSONSerialization.WritingOptions.prettyPrinted)
            req.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            req.httpBody = json
        }
        return req
    }
    
}
