//
//  ViewController.swift
//  What's The Day iOS
//
//  Created by Wojak on 2016-08-09.
//  Copyright © 2016 Wojak. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, UITextFieldDelegate {
    
    let schoolYear: [[Int]] = [
        [9, 9, 9, 9, 0, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9], // January
        [9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 9, 9, 9, 9, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1],       // February
        [9, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 0, 3, 4, 1], // March
        [9, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9],    // April
        [9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 9, 2, 3, 4, 1, 9, 9, 2, 3], // May
        [9, 4, 1, 2, 9, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],    // June
        [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9], // July
        [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9], // August
        [9, 9, 9, 9, 9, 9, 9, 9, 9, 0, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 5, 9, 9, 4, 1, 2],    // September
        [9, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 9, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9], // October
        [9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 9, 9, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2],    // November
        [9, 3, 4, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],  // December
    ] //same array that is in the gecko firmware that is filled with the day calendar for 2015-2016 school year

    let preferences = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var todayButton: UIButton!
    @IBOutlet var p1Room: UILabel!
    @IBOutlet var p2Room: UILabel!
    @IBOutlet var p3Room: UILabel!
    @IBOutlet var p4Room: UILabel!
    @IBOutlet var p1Text: UILabel!
    @IBOutlet var p2Text: UILabel!
    @IBOutlet var p3Text: UILabel!
    @IBOutlet var p4Text: UILabel!
    @IBOutlet weak var dateDisplay: UITextField!
    @IBOutlet var dayDisplay: UILabel! // text label that displays day number on screen and H if there is no school
    // class timeframe strings
    
    let p1Time = "  (8:15 AM - 9:30 AM)"
    let p2Time = "  (9:35 AM - 10:50 AM)"
    let p3Time = "  (11:15 AM - 12:30 PM)"
    let p4Time = "  (1:25 PM - 2:40 PM)"
    
    // strings to store classes
    
    var p1 : String!
    var p2 : String!
    var p3 : String!
    var p4 : String!
    var schedule : AnyObject!
    var classes : [[String]]!
    
    // changed date storage variables
    
    var dateChanged = false
    
    func month() -> Int {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Month, fromDate: date)
        let month = components.month
        
        return month
    }
    
    func day() -> Int {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Day, fromDate: date)
        let day = components.day
        
        return day
    }
    

    func getDate() -> String {
        let formatter = NSDateFormatter()
        let date = NSDate()
        formatter.dateStyle = .LongStyle
        return formatter.stringFromDate(date)
    }
    
    func dayNum() -> Int {
        return schoolYear[month() - 1][day()]
    }
    
    func closeKeyboard() {
        self.view.endEditing(true)
    }
    
    func buildSchedule() {
        schedule = preferences.objectForKey("schedule")
        classes = [
            [(schedule as! Schedule).d1p1, (schedule as! Schedule).d1p2, (schedule as! Schedule).d1p3, (schedule as! Schedule).d1p4],
            [(schedule as! Schedule).d2p1, (schedule as! Schedule).d2p2, (schedule as! Schedule).d2p3, (schedule as! Schedule).d2p4],
            [(schedule as! Schedule).d1p4, (schedule as! Schedule).d1p2, (schedule as! Schedule).d1p3, (schedule as! Schedule).d1p1],
            [(schedule as! Schedule).d2p4, (schedule as! Schedule).d2p2, (schedule as! Schedule).d2p3, (schedule as! Schedule).d2p1],
        ]
    }
    
    func update() {
    }
    
    func labelSetup() {
        p1Text.clipsToBounds = true
        p2Text.clipsToBounds = true
        p3Text.clipsToBounds = true
        p4Text.clipsToBounds = true
        p1Text.layer.cornerRadius = 15
        p2Text.layer.cornerRadius = 15
        p3Text.layer.cornerRadius = 15
        p4Text.layer.cornerRadius = 15
    }
    
    @IBAction func todayPressed(sender: UIButton) {
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        let datePicker = UIDatePicker()
        textField.inputView = datePicker
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.backgroundColor = UIColor.whiteColor()
        datePicker.addTarget(self, action: #selector(ViewController.datePickerChanged(_:)), forControlEvents: .ValueChanged)
    }
    
    func datePickerChanged(sender: UIDatePicker) {
        let formatter = NSDateFormatter()
        let cal = NSCalendar.currentCalendar()
        let comp = cal.component(.Month, fromDate: sender.date)
        print(comp)
        formatter.dateStyle = .LongStyle
        dateDisplay.text = formatter.stringFromDate(sender.date)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        dateDisplay.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        closeKeyboard()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (preferences.objectForKey("schedule") == nil) {
            self.performSegueWithIdentifier("setup", sender: nil)
        } else {
            buildSchedule()
        }
        // style view
        navigationController!.navigationBar.barTintColor = UIColor(red: 28.0/255, green: 63.0/255, blue: 148.0/255, alpha: 100.0/100.0)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        labelSetup()
        dateDisplay.text = getDate()
        // display current date in text box
        dateDisplay.delegate = self
        if (dayNum() == 9) {
            dayDisplay.text = "Day: H"
        } else {
            dayDisplay.text = "Day: \(dayNum())"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

