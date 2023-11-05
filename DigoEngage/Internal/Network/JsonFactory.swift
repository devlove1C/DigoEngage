//
//  JsonFactory.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23
//

import Foundation

/// Factory for creating new & reusing `JSONDecoder` & `JSONEncoder` instances.
internal class JsonFactory {
    /// Singleton.
    static let shared = JsonFactory()
    
    /// Hide init as the `shared` singleton should always be used.
    private init() {}
    
    /// Lazily created decoder for reuse.
    lazy var decoder: JSONDecoder = {
        return JSONDecoder()
    }()
    
    /// Lazily created encoder for reuse.
    lazy var encoder: JSONEncoder = {
        return JSONEncoder()
    }()
}
