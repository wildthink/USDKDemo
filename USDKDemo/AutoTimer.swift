//
//  AutoTimer.swift
//  USDKDemo
//
//  Created by Jason Jobe on 3/18/21.
//

import Foundation

public class AutoTimer {
    
    public typealias Stepper = (AutoTimer) -> Void
    
    var timer: Timer?
    var current: Int = 0
    var count: Int = 30
    var interval: TimeInterval
    var step: Stepper?
    
    public var elapsed: Int { current }
    public var remaining: Int { count - current }
    public var isFinished: Bool {
        (timer == nil) || (current >= count)
    }
    
    public init (count: Int, every secs: TimeInterval, step: Stepper? = nil) {
        self.count = count
        interval = secs
        self.step = step
    }
    
    public func start() -> Self {
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        timer?.tolerance = interval * 0.1
        return self
    }
    
    public func stop() {
        timer?.invalidate()
        self.timer = nil
    }

    @objc func tick(_ timer: Timer) {
        current += 1
        step?(self)
        if isFinished {
            stop()
        }
    }
}
