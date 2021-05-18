//
//  Loader.swift
//  NikeLab
//
//  Created by aarthur on 5/15/21.
//

import Foundation

/// For loading JSON and image data.
struct Loader<T: Decodable> {
    
    /// Load URL and parse payload into model objects matching T.
    /// - Parameters:
    ///   - url: RSS url.
    ///   - completion: Callback to pass either model object or error.
    func load(_ url: URL?, completion:@escaping (Swift.Result<T?, ServiceError>)->()) {
        _ = ServiceManager.sharedService.startServiceAt(url: url) { result in
            switch result {
            case .success(let payload):
                let fetchedObjects = JsonUtility<T>.parseJSON(payload)
                completion(.success(fetchedObjects))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Load URL for data only .
    /// - Parameters:
    ///   - url: RSS url.
    ///   - completion: Callback to pass either data object or error.
    func loadData(_ url: URL?, completion:@escaping (Swift.Result<T?, ServiceError>)->()) {
        _ = ServiceManager.sharedService.startServiceAt(url: url) { result in
            switch result {
            case .success(let payload):
                completion(.success(payload as? T))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

