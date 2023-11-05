//
//  ApiService.swift
//  DigoEngage
//
//  Created by dlovewanshi on 16/10/23.
//

import Foundation

/// Superclass of all API related Service classes.
public class ApiService {
    internal var networkService: TataNetworkService

    /// Init method
    internal init(networkService: TataNetworkService) {
        self.networkService = networkService
    }
}
