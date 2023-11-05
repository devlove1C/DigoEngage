//
//  URLSessionManager.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

internal class URLSessionFactory {
    /// Singleton.
    static let shared = URLSessionFactory()
    
    let defaultSession: URLSession = URLSession.shared
    
    /// Special case session for when we need a session that will never use any possible cached information controlled by the OS.
    lazy var noCacheSession: URLSession = {
        return URLSession(configuration: self.noCacheSessionConfig())
    }()
    
    private init() {}
    
    /// - Returns: Instance of ``URLSessionConfiguration`` that ensures we will always ignore local cache information & fetch fresh data from the request.
    private func noCacheSessionConfig() -> URLSessionConfiguration {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        return config
    }
}
