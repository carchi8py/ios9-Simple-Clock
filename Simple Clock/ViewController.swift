//
//  ViewController.swift
//  Simple Clock
//
//  Created by Chris Archibald on 11/26/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeLabel.text = ""
        let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateClock"), userInfo: nil, repeats: true)
    }
    
    func updateClock() {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute, .Second], fromDate: date)
        
        // Hour is returned in miliary time
        var hour = components.hour > 12 ? components.hour - 12 : components.hour
        hour = hour == 0 ? 12 : hour
        
        //Adds a 0 to the front of the hour if it less than 9
        let hourString = appendZero(hour)
        let minuteString = appendZero(components.minute)
        let secondString = appendZero(components.second)
        
        let am = components.hour > 12 ? "PM" : "AM"
        
        timeLabel.text = "\(hourString):\(minuteString):\(secondString) \(am)"
        
    }
    
    func appendZero(time:Int) -> String
    {
        return time > 9 ? "\(time)" : "0\(time)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

