//
//  ViewController.swift
//  USDKDemo
//
//  Created by Jason Jobe on 2/22/21.
//

import UIKit
import LSUniversalSDK

class ViewController: UIViewController {

    @IBOutlet var pinField: UITextField!
    
    var sdk: LSUniversal!
    var url: URL =
        URL(string:
                "https://guest.sightcall.com/call/b7cdc700d817ddf86f143675340d0f7a15b46110")!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sdk = LSUniversal()
        sdk?.delegate = self
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        displayConsent(with: LSConsentDescription())
        sdk.start(with: url.absoluteString, useWebSocketSecure: true)
    }

    @IBAction
    func activate() {
        guard let vc = self.sdk.callViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
//        self.present(vc, animated: false, completion: nil)
    }
}

extension ViewController: LSUniversalDelegate {
    
    func showDisplayNameAlert(_ alertController: UIAlertController?) {
        guard let alertController = alertController else { return }
        present(alertController, animated: false, completion: nil)
        /**
         Present the alertController, here
         **/
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
        /**
         Display the controller in your current view hierarchy
         **/
    }
    
    func connectionEvent(_ status: lsConnectionStatus_t) {
        DispatchQueue.main.async {
            switch status {
                case .callActive:
                    print (#function, #line)
                    guard let vc = self.sdk.callViewController else { return }
                    self.present(vc, animated: false, completion: nil)
                case .disconnecting:
                    print (#function, #line)
//                    guard let vc = self.sdk.callViewController else { return }
                    self.dismiss(animated: false, completion: nil)
                /**
                 Remove self.lsUniversal.callViewController from your view hierarchy
                 **/
                default:
                    break
            }
        }
    }
    
    func connectionError(_ error: lsConnectionError_t) {
        DispatchQueue.main.async {
            print (#function, #line)
            
            switch error {
                default:
                    break
            }
        }
    }
    
    func callReport(_ callEnd: LSCallReport) {
        print (#function, #line)
    }
}
