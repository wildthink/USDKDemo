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
    
    // https://guest.sightcall.com/call/b7cdc700d817ddf86f143675340d0f7a15b46110
    // direct: 6260003ec186e1fd69e3da25fe6b74634edba71d
    // https://guest.sightcall.com/call/6260003ec186e1fd69e3da25fe6b74634edba71d

//    var url_s: String? = UserDefaults.standard.string(forKey: "agent_url")
//        ?? "https://guest.sightcall.com/call/6260003ec186e1fd69e3da25fe6b74634edba71d"
//        // "https://guest.sightcall.com/call/b7cdc700d817ddf86f143675340d0f7a15b46110?pin=699274"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func url(_ key: String) -> URL? {
        if let u = UIPasteboard.general.url { return u }
        if let str = UserDefaults.standard.string(forKey: key),
           let u = URL(string: str)
        {
            return u
        }
        return nil
    }
    
    @IBAction
    func connect() {
        if let url = url("agent_url") {
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

