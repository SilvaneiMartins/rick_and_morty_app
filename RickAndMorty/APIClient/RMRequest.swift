//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Silvanei  Martins on 03/03/23.
//

import Foundation

/// Object that represents a singlet API call
final class RMRequest {
    /// API Constructor
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    private let endpoint: RMEndpoint
    
    /// Path components for API, if any
    private let pathComponents: [String]
    
    /// Query arguments for API, if any
    private let queryParameters: [URLQueryItem]

    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentsString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentsString
        }
        return string
    }

    
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "Get"
    
    // MARK: - Public
    
    /// Construct  request
    /// - Parameters
    ///     - endpoint: Target endpoint
    ///     - pathComponents: Collection of Path components
    ///     - queryParameters: Collection of query parameters
    init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseUrl) {
            return nil
        }
        
        let trimmed = string.replacingOccurrences(of: Constants.baseUrl+"/", with: "")
        
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0]
                if let rmEndPoint = RMEndpoint(rawValue: endpointString) {
                    self.init(endpoint: rmEndPoint)
                    return
                }
            }
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty {
                let endpointString = components[0]
                if let rmEndPoint = RMEndpoint(rawValue: endpointString) {
                    self.init(endpoint: rmEndPoint)
                    return
                }
            }
        }
        return nil
    }
}


extension RMRequest {
    static let listCharactersRequests = RMRequest(endpoint: .character)
}
