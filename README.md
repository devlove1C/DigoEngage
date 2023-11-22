
# PSL-Engage-SDK

PSL-Engage-SDK provides a platform which enables companies to deliver personalized interactions to their users through push notifications, in-app campaigns, and other re-targeting channels.

## Integration

### Integration through CocoaPods
CocoaPods is a dependency manager for Swift projects and makes integration easier.

1. If you don't have CocoaPods installed, you can do it by executing the following line in your terminal.

    ```sudo gem install cocoapods```
    
2. If you don't have a Podfile, create a plain text file named Podfile in the Xcode project directory with the following content, making sure to set the platform and version that matches your app.

    ```pod 'PSL-Engage-SDK'```
    
3. Install PSL-Engage-SDK SDK by executing the following in the Xcode project directory.

    ```pod install```
    
4. Now, open your project workspace and check if PSL-Engage-SDK SDK is properly added.
    

## SDK Initialization

Todo:- Will update it according to dashboard
Login to your PSL-Engage-SDK account, go to **Settings** in the left panel of the dashboard. Under App Settings, you will find your **APP ID**. Provide this APP ID while initializing the SDK with **initializeDefaultTestInstanceWithConfig:** and **initializeDefaultLiveInstanceWithConfig:** methods as shown below.

### In Swift:

    Todo:- Will update it according the Implementation 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:     [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
        //Create a config object
        let sdkConfig = TataSDKManagerConfig(withAppID: "Your App ID")
        
        // Separate initialization methods for Test and Live Environments
        #if DEBUG
            TataSDKManager.shared.initializeDefaultSDKInstance(with: sdkConfig, andLaunchOptions: launchOptions)
        #else
            TataSDKManager.shared.initializeDefaultLiveInstance(with: sdkConfig, andLaunchOptions: launchOptions)
        #endif
        
        //Rest of the implementation of method
        //-------
    }

Thats it!! SDK is successfully integrated and initialized in the project, and ready to use. 

