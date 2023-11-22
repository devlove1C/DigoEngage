//
//  DefaultManager.swift
//  PSL-Engage-SDK
//
//  Created by dlovewanshi on 21/11/23.
//

import Foundation

public class DefaultManager {
    
    public static let shared = DefaultManager()
    
    private init() {}
    
    func string(key: String) -> String? {
        return UserDefaults.standard.string(forKey: key) ?? nil
    }
    
    func set(keyValue: String, forKey key: String) {
        UserDefaults.standard.set(keyValue, forKey: key)
    }
    
}
