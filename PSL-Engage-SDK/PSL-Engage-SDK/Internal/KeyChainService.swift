//
//  KeyChainService.swift
//  PSL-Engage-SDK
//
//  Created by dlovewanshi on 21/11/23.
//

import Foundation
import Security

class KeychainService {
    class func save(key: String, data: String) -> Bool {
        if let dataFromString = data.data(using: .utf8) {
            var query = [
                kSecClass as String       : kSecClassGenericPassword as String,
                kSecAttrAccount as String : key,
                kSecValueData as String   : dataFromString
            ] as [String : Any]

            SecItemDelete(query as CFDictionary)

            query[kSecAttrAccessible as String] = kSecAttrAccessibleWhenUnlocked

            let status: OSStatus = SecItemAdd(query as CFDictionary, nil)

            return status == noErr
        }
        return false
    }

    class func load(key: String) -> String? {
        let query = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecReturnData as String  : kCFBooleanTrue!,
            kSecMatchLimit as String  : kSecMatchLimitOne
        ] as [String : Any]

        var dataTypeRef: AnyObject?

        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == noErr {
            if let retrievedData = dataTypeRef as? Data,
               let result = String(data: retrievedData, encoding: .utf8) {
                return result
            }
        }
        return nil
    }
}
