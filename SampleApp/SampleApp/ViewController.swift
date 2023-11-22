//
//  ViewController.swift
//  SampleApp
//
//  Created by dlovewanshi on 06/11/23.
//
import PSL_Engage_SDK
import UIKit
import AdSupport
import AppTrackingTransparency

class ViewController: UIViewController {
    @IBOutlet weak var txt_event_name: UITextField!
    
    @IBOutlet weak var txt_contact_id: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDataManager.shared.setUserEmail(email: "devTest@gmail.com")
        UserDataManager.shared.setUserGender(gender: "Male")
        txt_event_name.text = "Install"
        txt_contact_id.text = "60109"
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


