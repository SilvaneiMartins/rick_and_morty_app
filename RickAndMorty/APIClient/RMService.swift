//
//  RMService.swift
//  RickAndMorty
//
//  Created by Silvanei  Martins on 03/03/23.
//

import Foundation

/// Primary API Service object to get Rick and Morly data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatezed constructor
    private init() {}
    
    /// Send Rick and Morly API call
    /// - Parameters:
    ///     - request: Request instance
    ///     - type: The type of object we expect to get back
    ///     - completion: Calback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (
            Result<T, Error>) -> Void
    ) {
            
    }	
}
