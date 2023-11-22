//
//  TataSDKManager.swift
//  DigoEngage
//
//  Created by dlovewanshi on 16/10/23.
//

import Foundation

/// entry  for using the SDK.
public class SDKEventManager {
    public static let shared = SDKEventManager(networkService: TataNetworkService(networking: NetworkService()))

    ///Log Event API service
    public internal(set) var event: LogEventApiService
    internal var networkService: TataNetworkService
    private init(networkService: TataNetworkService) {
        self.networkService = networkService
        self.event = LogEventApiService(networkService: networkService)
    }
}
