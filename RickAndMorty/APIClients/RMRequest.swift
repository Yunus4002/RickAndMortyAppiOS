//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Asadbek on 29/12/22.
//

import Foundation


 ///Object to represent a single API call
final class RMRequest {
    //API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired EndPoint
    private let endPoint: RMEndpoint
    
    /// Path components for APIs, if any
    private let pathComponents: [String]
    
    private let queryParameters: [URLQueryItem]
    
    
    /// Constructed for the API request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                
                guard let value = $0.value else { return nil }
                
                return "\($0.name)=\(value)"

            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed & Constructed URL
    public var url: URL? {
        return URL(string: urlString)
        
    }
    
    /// HTTP Method
    public let httpMethod = "GET"
    
    //MARK: -> Public
    
    /// Construct Request
    /// - Parameters:
    ///   - endPoint: Target EndPoint
    ///   - pathComponents: Collection of Path components
    ///   - queryParameters: Collection of query components
    public init(
        endPoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    /// Attempt to create request
    /// - Parameter url: URL to parse
    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseUrl) {
            return nil
        }
        let trimmed = string.replacingOccurrences(of: Constants.baseUrl+"/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endPointString = components[0]
                var pathComponents: [String] = []
                if components.count > 1 {
                    pathComponents = components
                    pathComponents.removeFirst()
                }
                if let rmEndPoint = RMEndpoint(rawValue: endPointString) {
                    self.init(endPoint: rmEndPoint,pathComponents: pathComponents)
                    return
                }
                    
            }
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endPointString = components[0]
                let queryItemsString = components[1]
                //value=name&value=name
                let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else {
                        return nil
                    }
                    
                    let parts = $0.components(separatedBy: "=")
                    
                    return URLQueryItem(
                        name: parts[0],
                        value: parts[1]
                    )
                })
                if let rmEndPoint = RMEndpoint(rawValue: endPointString) {
                    self.init(endPoint: rmEndPoint,queryParameters: queryItems)
                    return
                }
                    
            }
            
        }
        
        return nil
            
    }
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(endPoint: .character)
}



