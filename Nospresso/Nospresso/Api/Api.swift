//
//  Api.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 13/10/20.
//

import Foundation

class Api {
    let baseURL: String = "http://localhost:3000"
    
    typealias SuccessResult<T: Decodable> = (T) -> Void
    typealias FailureResult = (String) -> Void
    
    func request<T: Decodable>(endpoint: Endpoint, success: @escaping SuccessResult<T>, failure: @escaping FailureResult) {
        let fullURL: String = "\(baseURL)/\(endpoint.url)"
        
        guard let url = URL(string: fullURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                // TODO validar erro
                return
            }
            
            guard let data = data else {
                // TODO validar dados invalidos
                return
            }
            
            
            let decoder = JSONDecoder()

            do {
                let decodedData = try decoder.decode(T.self, from: data)
                success(decodedData)
            } catch {
                print(error)
                // TODO Tratar erro
            }
        }.resume()
    }
}
