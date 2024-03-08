//
//  NetworkManager.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}

    func fetchData<T: Codable>(with url: URL, completion: @escaping (Result <T, Error>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
                    
            if let data = data {
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(object))
                } catch  {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
