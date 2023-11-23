//
//  SDKError.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

public enum SDKError: Error {
    case badRequest
    /// Network error encountered. potential attached error
    case networkError(_ error: Error? = nil)
    /// Failed to interpret server response as expected, potential attached error
    case badServerResponse(_ error: Error? = nil)
    /// Authentication failed due to invalid credentials.
   
    case serviceError
    /// An unexpected network error occured,
    case unexpectedNetworkError(_ httpStatusCode: Int)
    /// Entirely unknown cause, log as much detail for debugging as possible & do not retry unless you think it's appropriate. May have attached error.
    case unknown(_ error: Error? = nil)
    /// General failure with specified reason for debugging.
    case failed(reason: String)
    
    /// - Returns: `Bool` indicating wheather retry is advisable (`true` for yes, `false` for no).
    public func isRetryable() -> Bool {
        let result: Bool
    
        switch self {
        case .badRequest, .serviceError, .networkError:
            result = true
        case .unexpectedNetworkError, .unknown, .badServerResponse, .failed(reason:):
            result = false
        }
        return result
    }
}
