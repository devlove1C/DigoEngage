//
//  ViewController.swift
//  SampleApp
//
//  Created by dlovewanshi on 06/11/23.
//
import PSL_Engage_SDK
import UIKit
//import AdSupport
//import AppTrackingTransparency
import UserNotifications
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var txt_event_name: UITextField!
    
    @IBOutlet weak var txt_contact_id: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDataManager.shared.setUserEmail(email: "devTest@gmail.com")
        UserDataManager.shared.setUserGender(gender: "Male")
       
        txt_event_name.text = "Install"
        txt_contact_id.text = "60109"
        
        LocationManager.shared.locationUpdateHandler = { location in
            print("Updated Location is \(location.coordinate.latitude) \(location.coordinate.longitude)")
            let userLocationLat = location.coordinate.latitude
            let userLocationLong = location.coordinate.longitude
            UserDataManager.shared.setUserLocation(location:  EngageGeoLocation(withlatitute: userLocationLat, andlongitute: userLocationLong))
        }

        /// Required to register the local notification
        UNUserNotificationCenter.current().delegate = self
        self.scheduleNotification()
    }
        
    @IBAction func signInEvent(_ sender: UIButton) {
        logEvent(event: AppEvent.moeSignIn)
    }
    
    @IBAction func signOutEvent(_ sender: UIButton) {
        logEvent(event: AppEvent.moeLogout)
    }
    
    func logEvent(event: AppEvent)  {
        Task {
            _ = try await SDKEventManager.shared.event.logEventService(eventName: event, advertisingIdentifier: "123256", vendorIdentifier: "vendror.com", contactId: "60109")
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        LocationManager.shared.stopUpdatingLocation()
    }
    
//    func getAdvertisingIdentifier() -> String {
//        guard ASIdentifierManager.shared().isAdvertisingTrackingEnabled else {
//            return "Tracking not enabled"
//        }
//        let identifier = ASIdentifierManager.shared().advertisingIdentifier.uuidString
//        print("Identifier is ------->\(identifier)")
//        return identifier
//    }
//
//    func requestPermission() {
//        if #available(iOS 14, *) {
//            ATTrackingManager.requestTrackingAuthorization { status in
//                switch status {
//                case .authorized:
//                    // Tracking authorization dialog was shown
//                    // and we are authorized
//                    print("Authorized and identifier is :-")
//
//                    // Now that we are authorized we can get the IDFA
//                    print(ASIdentifierManager.shared().advertisingIdentifier)
//                    print(ASIdentifierManager.shared().advertisingIdentifier.uuidString)
//                case .denied:
//                    // Tracking authorization dialog was
//                    // shown and permission is denied
//                    print("Denied")
//                case .notDetermined:
//                    // Tracking authorization dialog has not been shown
//                    print("Not Determined")
//                case .restricted:
//                    print("Restricted")
//                @unknown default:
//                    print("Unknown")
//                }
//            }
//        }
//    }
    
    @IBAction func addEvent(_ sender: UIButton) {
//        addNewEvent()
    }
}


//MARK: - UNUserNotificationCenterDelegate
extension ViewController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == "customNotification" {
            showLowBalanceAlert()
        }
        completionHandler([.badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "customNotification" {
            showLowBalanceAlert()
        }
        completionHandler()
    }
    
    func scheduleNotification() {
        // Define actions
        let agreeAction = UNNotificationAction(identifier: "AGREE_ACTION", title: "Agree", options: [])
        let disagreeAction = UNNotificationAction(identifier: "DISAGREE_ACTION", title: "Disagree", options: [])
        
        // Define category
        let notificationCategory = UNNotificationCategory(identifier: "CUSTOM_CATEGORY", actions: [agreeAction, disagreeAction], intentIdentifiers: [], options: [])
        
        // Register the category
        UNUserNotificationCenter.current().setNotificationCategories([notificationCategory])
        
        // Create notification content
        let content = UNMutableNotificationContent()
        content.title = "Custom Notification"
        content.body = "This is a custom local notification."
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "CUSTOM_CATEGORY"
        
        // Set the notification trigger to 5 seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        
        // Create the notification request
        let request = UNNotificationRequest(identifier: "customNotification", content: content, trigger: trigger)
        
        // Schedule the notification
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                // Handle error
                print("Error scheduling notification: \(error)")
            }
        }
    }
    
    /// Low balance alert
    func showLowBalanceAlert() {
        let alertController = UIAlertController(title: "Low balance", message: "Your account balance is low. Please recharge to avoid disruptions", preferredStyle: .alert)
        let rechareAction = UIAlertAction(title: "Recharge", style: .default) { _ in
            print("Perform recharge action")
        }
        alertController.addAction(rechareAction)
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}
