//
//  Loader.swift
//  NikeLab
//
//  Created by aarthur on 5/15/21.
//

import Foundation

struct Loader<T: Decodable> {
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

