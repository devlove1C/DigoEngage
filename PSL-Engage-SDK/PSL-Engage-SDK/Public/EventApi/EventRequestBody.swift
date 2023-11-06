//
//  EventBody.swift
//  DigoEngage
//
//  Created by dlovewanshi on 16/10/23.
//

import Foundation
internal struct EventRequestBody {
    /// userId
    let userId: String
}

extension EventRequestBody: Codable {
    enum CodingKeys: String, CodingKey {
        case userId
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decode(String.self, forKey: .userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userId, forKey: .userId)
    }
}
