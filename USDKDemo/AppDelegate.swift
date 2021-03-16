//
//  AppDelegate.swift
//  USDKDemo
//
//  Created by Jason Jobe on 2/22/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UserDefaults.standard.register(settings: "Settings")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

//extension AppDelegate {
//    
//    func setupUserDefaults() {
//        let ud = UserDefaults.standard
//        //  "https://guest.sightcall.com/call/6260003ec186e1fd69e3da25fe6b74634edba71d"
//
//        ud.setValue("https://guest.sightcall.com/call/", forKey: "CallBaseURL")
//        ud.setValue("6260003ec186e1fd69e3da25fe6b74634edba71d", forKey: "CodeCallId")
//        ud.setValue("6260003ec186e1fd69e3da25fe6b74634edba71d", forKey: "ACDCallId")
//    }
//}
