//
//  WebService.swift
//  NY Times
//
//  Created by Lohith on 13/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String: String]


struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
    var httpHeader :  HTTPHeaders = [
           "Accept": "application/json",
       ]
}

extension Resource {
    init(url: URL) {
        self.url = url
    }
}


class Webservice {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.allHTTPHeaderFields = resource.httpHeader
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            let result = try? JSONDecoder().decode(T.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
        
    }
    
    
    static func getCompleteUrl (_ period : Period)->URL?{
        
        return URL(string: "\(WebConnection.baseUrl)\(period.rawValue).json?api-key=\(WebConnection.apiKey)")
    }
}
