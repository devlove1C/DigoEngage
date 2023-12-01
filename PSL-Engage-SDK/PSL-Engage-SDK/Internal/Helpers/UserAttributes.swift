//
//  UserAttributes.swift
//  Pods-SampleApp
//
//  Created by dlovewanshi on 06/11/23.
//

import Foundation

internal struct UserAttributes: Codable {
    var email: String
    var gender: String
    var birthday: String
    var location: String
    var lat: Double
    var long: Double
    var lastName: String
    var firstName: String
    var mobileNumber: String
    var userPushPreference: String
    var advertisingIdentifier: String
    var moengagePushOptedOut: String
    var pushOptInStatusiOS: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case gender
        case birthday
        case location
        case lat
        case long
        case lastName = "last_name"
        case firstName = "first_name"
        case mobileNumber = "mobile_number "
        case userPushPreference = "user_push_preference"
        case advertisingIdentifier = "advertising_identifier"
        case moengagePushOptedOut = "moengage_push_opted_out"
        case pushOptInStatusiOS = "push_opt_in_status (iOS)"
    }
    
    init(email: String, gender: String, birthday: String, location: String, lastName: String, firstName: String, mobileNumber: String, userPushPreference: String, advertisingIdentifier: String, moengagePushOptedOut: String, pushOptInStatusiOS: String) {
        self.email = email
        self.gender = gender
        self.birthday = birthday
        self.location = location
        self.lastName = lastName
        self.firstName = firstName
        self.mobileNumber = mobileNumber
        self.userPushPreference = userPushPreference
        self.advertisingIdentifier = advertisingIdentifier
        self.moengagePushOptedOut  = moengagePushOptedOut
        self.pushOptInStatusiOS = pushOptInStatusiOS
        self.lat = 23.00
        self.long = 434.00
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(email, forKey: .email)
        try container.encode(gender, forKey: .gender)
        try container.encode(birthday, forKey: .birthday)
        try container.encode(location, forKey: .location)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(mobileNumber, forKey: .mobileNumber)
        try container.encode(userPushPreference, forKey: .userPushPreference)
        try container.encode(advertisingIdentifier, forKey: .advertisingIdentifier)
        try container.encode(moengagePushOptedOut, forKey: .moengagePushOptedOut)
        try container.encode(pushOptInStatusiOS, forKey: .pushOptInStatusiOS)
    }
}

