//
//  UserDataManager.swift
//  PSL-Engage-SDK
//
//  Created by dlovewanshi on 09/11/23.
//

import Foundation

public class UserDataManager {
    public static let shared = UserDataManager()
    var userAttributes: UserAttributes
    
    private init() {
        userAttributes = UserAttributes(email: "", gender: "", birthday: "", location: "", lastName: "", firstName: "", mobileNumber: "", userPushPreference: "", advertisingIdentifier: "", moengagePushOptedOut: "", pushOptInStatusiOS: "")
    }
    
    public func setUserEmail(email: String) {
        userAttributes.email = email
    }
    public func setUserGender(gender: String) {
        userAttributes.gender = gender
    }
    public func setUserBirthday(birthday: String) {
        userAttributes.birthday = birthday
    }
    public func setUserFirstName(firstName: String) {
        userAttributes.firstName = firstName
    }
    public func setUserMobileNumber(mobileNumber: String) {
        userAttributes.mobileNumber = mobileNumber
    }
    
    public func setUserPushPreference(userPushPreference: String) {
        userAttributes.userPushPreference = userPushPreference
    }
    
    public func setUserAdvertisingIdentifier(advertisingIdentifier: String) {
        userAttributes.advertisingIdentifier = advertisingIdentifier
    }
    
    public func setUserMoengagePushOptedOut(moengagePushOptedOut: String) {
        userAttributes.moengagePushOptedOut = moengagePushOptedOut
    }
    
    public func setUserPushOptInStatusiOS(pushOptInStatusiOS: String) {
        userAttributes.pushOptInStatusiOS = pushOptInStatusiOS
    }
    
    public func setAdvertisementIdentifier(identifier: String) {
        DeviceAttributes.identifier = identifier
    }
    
    public func setUserLocation(location: EngageGeoLocation) {
//        userAttributes.lat = location.latitute
//        userAttributes.lon  = location.longitute
    }
}
