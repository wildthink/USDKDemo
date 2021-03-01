//
//  SceneDelegate.swift
//  USDKDemo
//
//  Created by Jason Jobe on 2/22/21.
//

import UIKit
import LSUniversalSDK


var sdk: SightCallSDK!


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        sdk = SightCallSDK(window: window)
    }

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        guard let url = userActivity.webpageURL else { return }
        sdk.start(with: url)
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        sdk.start(with: url)
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

/*
extension SceneDelegate: LSUniversalDelegate {

    func showDisplayNameAlert(_ alertController: UIAlertController?) {
        present(alertController)
    }
    
    func displayConsent(with description: LSConsentDescription?) {
        let controller = UIAlertController(title: description?.title, message: description?.message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: description?.cancelLabel, style: .cancel, handler: { _ in
            description?.consent?(false)
        }))
        controller.addAction(UIAlertAction(title: description?.eulaURL, style: .default, handler: { _ in
            guard let urlString = description?.eulaURL,
                  let url = URL(string: urlString)
            else { return }
            /**
             Show the content of the url page
             **/
        }))
        controller.addAction(UIAlertAction(title: description?.agreeLabel, style: .default, handler: { _ in
            description?.consent?(true)
        }))
        present(controller)
    }
    
    func connectionEvent(_ status: lsConnectionStatus_t) {
        //            print (#function, #line, "\(status)", status.rawValue)
        switch status {
        case .callActive:
            present(sdk.callViewController)
        case .disconnecting:
            dismissPresentedViewControler()
        default:
            break
        }
    }
    
    func connectionError(_ error: lsConnectionError_t) {
        print (#function, #line, "\(error)", error.rawValue)
    }
    
    func callReport(_ callEnd: LSCallReport) {
        print (#function, #line, callEnd)
    }
}

extension SceneDelegate {
    
    func present (_ viewController: UIViewController?, animated: Bool = false) {
        guard let viewController = viewController else { return }
        DispatchQueue.main.async {
            self.window?.rootViewController?.present(viewController, animated: animated, completion: nil)
        }
    }
 
    func dismissPresentedViewControler() {
        DispatchQueue.main.async {
            self.window?.rootViewController?.dismiss(animated: false, completion: nil)
        }
    }
    
}
*/

