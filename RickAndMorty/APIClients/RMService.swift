//
//  RMService.swift
//  RickAndMorty
//
//  Created by Asadbek on 29/12/22.
//
// This file is for calling APIs 
import Foundation



/// Service object to get data for Rick and Morty app
final class RMService {
    ///Shared singleton instance
    static let shared = RMService()
    ///Privatized constructor
    private init() {}
    
    enum RMerviceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - comletion: Callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        comletion: @escaping (Result<T, Error>) -> Void ) {
            
            guard let urlRequest = self.request(from: request) else {
                comletion(.failure(RMerviceError.failedToCreateRequest))
                
                return
            }
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
                guard let data = data, error == nil else  {
                    comletion(.failure(error ?? RMerviceError.failedToGetData))
                    return
                }
                // Decode response
                do {
                    let result = try JSONDecoder().decode(type.self, from: data)
                    comletion(.success(result))
                }
                catch {
                    comletion(.failure(error))
                }
            }
            task.resume()
        }
    
    //MARK: -> Private
    
    private func request(from rmRequest:RMRequest) -> URLRequest? {
        
        guard let url = rmRequest.url else { return nil }
        var request =  URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
        
    }
    
}
