//
//  JsonFactory.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23
//

import Foundation

/// This Class for creating new & reusing `JSONDecoder` & `JSONEncoder` instances.
internal class JsonFactory {
    /// Singleton.
    static let shared = JsonFactory()
    
    private init() {}
    
    /// Lazily created decoder , and encoder for reuse.
    lazy var decoder: JSONDecoder = {
        return JSONDecoder()
    }()
    
    lazy var encoder: JSONEncoder = {
        return JSONEncoder()
    }()
}
