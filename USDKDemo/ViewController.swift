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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func url(_ key: String) -> URL? {
        if let str = UserDefaults.standard.string(forKey: key),
           let u = URL(string: str)
        {
            return u
        }
        return nil
    }
    
    @IBAction
    func connect() {
        if let url = UIPasteboard.general.url ?? url("agent_url") {
            print (#function, url.absoluteString)
            sightCall?.start(with: url)
        }
    }
    
    @IBAction
    func call() {
        if let url = url("acd_url") {
            print (#function, url.absoluteString)
            sightCall?.start(with: url)
        }
    }

}

