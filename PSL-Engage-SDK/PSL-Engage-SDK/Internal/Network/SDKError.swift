//
//  SDKError.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

/// All cases of errors the SDK should throw, that mostly need to be handled or logged for your own tracking.
public enum SDKError: Error {
    case badRequest
    /// Network error. May have attached error.
    case networkError(_ error: Error? = nil)
    /// We failed to parse the server response as expected. May have attached error.
    case badServerResponse(_ error: Error? = nil)
    /// Failed due to the provided authenticatioin not being valid, or perhaps out of date.
   
    case serviceError
    /// Received an unexpected network error, retry at your own discression.
    case unexpectedNetworkError(_ httpStatusCode: Int)
    /// Entirely unknown cause, log as much detail for debugging as possible & do not retry unless you think it's appropriate. May have attached error.
    case unknown(_ error: Error? = nil)
    /// Generic failed case with a reason given for debugging.
    case failed(reason: String)
    
    
    /// Helps to easily decide if you should retry the same SDK operation or not.
    /// - Returns: `Bool` indicator of if we believe the error is something that should be retried or not. `true` if you should retry, `false` if not
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
