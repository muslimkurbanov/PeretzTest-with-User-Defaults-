//
//  NetworkService.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 18.06.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import Foundation
import Alamofire

//MARK: - NetworkServiceProtocol
protocol NetworkServiceProtocol {
//    func getComments(completion: @escaping (Result<[Model]?, Error>) -> Void)
    func getMenu(complletion: @escaping (Result<[Model]?, Error>) -> Void)
}

//MARK: - NetworkService
class NetworkService: NetworkServiceProtocol {
    func getMenu(complletion: @escaping (Result<[Model]?, Error>) -> Void) {
        
        let urlString = "https://peretz-group.ru/api/v2/products?category=51&key=47be9031474183ea92958d5e255d888e47bdad44afd5d7b7201d0eb572be5278"
        
        AF
            .request(urlString, method: .get, parameters: nil)
            .responseJSON { (response) in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success(let value):
                    if let arrayDictionary = value as? [[String: Any]] {
                        do {
                            let data = try JSONSerialization.data(withJSONObject: arrayDictionary, options: .fragmentsAllowed)
                            print(data)
//                            let decoder = JSONDecoder()
//                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let result = try JSONDecoder().decode([Model].self, from: data)
                            complletion(.success(result))
                            print(result)
                        } catch {
                            complletion(.failure(error))
                            print(error)
                        }
                    }
                }
            }.resume()
    }
    
    
//    static let shared = NetworkService()

    
//    func getComments(completion: @escaping (Result<[Model]?, Error>) -> Void) {
//    
//        let urlString = "https://peretz-group.ru/api/v2/products?category=93&key=47be9031474183ea92958d5e255d888e47bdad44afd5d7b7201d0eb572be5278"
//        guard let url = URL(string: urlString) else { return }
//        
//        //MARK: - URLSession
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            do {
//                let obj = try JSONDecoder().decode([Model].self, from: data!)
//                completion(.success(obj))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
    
//    func getMenu(completion: @escaping (Result<[Model]?, Error) -> Void {
//        
//        let urlString = "https://peretz-group.ru/api/v2/products?category=93&key=47be9031474183ea92958d5e255d888e47bdad44afd5d7b7201d0eb572be5278"
//        
//        AF
//            .request(urlString, method: .get, parameters: nil)
//            .responseJSON { (response) in
//                switch response.result {
//                case .failure(let error):
//                    onError(error.localizedDescription)
//                    
//                case .success(let value):
//                    if let arrayDictionary = value as? [[String: Any]] {
//                        do {
//                            let data = try JSONSerialization.data(withJSONObject: arrayDictionary, options: .fragmentsAllowed)
//                            let decoder = JSONDecoder()
//                            decoder.keyDecodingStrategy = .convertFromSnakeCase
//                            let result = try decoder.decode([Model].self, from: data)
//                            onSuccess(result)
//                            print(result)
//                        } catch {
//                            onError("Parse error: \(error.localizedDescription)")
//                        }
//                    }
//                }
//            }
//    }
}
