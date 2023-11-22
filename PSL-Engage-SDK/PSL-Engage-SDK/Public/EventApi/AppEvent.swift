//
//  AppEvent.swift
//  PSL-Engage-SDK
//
//  Created by dlovewanshi on 22/11/23.
//

import Foundation

public enum AppEvent: String {
    case installApp = "INSTALL"
    case reinstall  = "REINSTALL"
    case updateApp  = "UPDATE"
    case pushPreferenceChanged  = "MO_PUSH_PREFERENCE_CHANGED"
    case notificationReceivediOS  = "Notification Received iOS"
    case notificationClickediOS  = "Notification Clicked iOS"
    case notification_dismissediOSMoe  = "NOTIFICATION_DISMISSED_IOS_MOE"
    case geoFenceTriggered  = "Geo Fence Triggered"
    case mobileInAppShown  = "Mobile In-App Shown"
    case mobileInAppClicked  = "Mobile In-App Clicked"
    case mobileInAppClosed  = "Mobile In-App Closed"
    case mobileInAppAutoDismissed  = "Mobile In-App Auto Dismissed"
    case mobileAppRatingDone  = "Mobile App Rating Done"
    case dtCampaignScheduled = "DT_CAMPAIGN_SCHEDULED"
    case dtCampaignScheduledFailed = "DT_CAMPAIGN_SCHEDULE_FAILED"
    case moeAppExit = "MOE_APP_EXIT"
    case moeLogout = "MOE_LOGOUT"
    case moeSignIn = "MOE_SIGNIN"
}
