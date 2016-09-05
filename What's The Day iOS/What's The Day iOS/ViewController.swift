//
//  ViewController.swift
//  What's The Day iOS
//
//  Created by Wojak on 2016-08-09.
//  Copyright © 2016 Wojak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let schoolYear : [[Int]] = [
        [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2, 3], // January
        [9, 4, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 9, 9, 9, 9, 4, 1, 2, 3, 9, 9, 4, 1],           // February
        [9, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 2, 3, 4, 1],  // March
        [9, 9, 9, 2, 3, 4, 1, 2, 9, 9, 3, 4, 1, 2, 9, 9, 9, 9, 3, 4, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9],   // April
        [9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9, 9, 3, 4, 1, 2, 9, 9, 3, 4, 1], // May
        [9, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],    // June
        [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],   // July
        [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],   // August
        [9, 9, 9, 9, 9, 9, 9, 0, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 0, 9, 9, 4, 1, 2, 3, 4],  // September
        [9, 9, 9, 1, 2, 3, 4, 1, 9, 9, 0, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4], // October
        [9, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 9, 9, 9, 9, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2, 3, 4],    // November
        [9, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9], // December
    ] // Day Calendar 2016 - 2017

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
    
    var p1R : String!
    var p2R : String!
    var p3R : String!
    var p4R : String!
    
    var schedule : AnyObject!
    var classes : [[String]]!
    var rooms : [[String]]!
    
    // changed date storage variables
    var dayNumber : Int!
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
        classes = [
            [preferences.stringForKey("D1P1")!, preferences.stringForKey("D1P2")!, preferences.stringForKey("D1P3")!, preferences.stringForKey("D1P4")!],
            [preferences.stringForKey("D2P1")!, preferences.stringForKey("D2P2")!, preferences.stringForKey("D2P3")!, preferences.stringForKey("D2P4")!],
            [preferences.stringForKey("D1P4")!, preferences.stringForKey("D1P2")!, preferences.stringForKey("D1P3")!, preferences.stringForKey("D1P1")!],
            [preferences.stringForKey("D2P4")!, preferences.stringForKey("D2P2")!, preferences.stringForKey("D2P3")!, preferences.stringForKey("D2P1")!],
        ]
    }
    
    func buildRooms() {
        rooms = [
            [preferences.stringForKey("D1P1R")!, preferences.stringForKey("D1P2R")!, preferences.stringForKey("D1P3R")!, preferences.stringForKey("D1P4R")!],
            [preferences.stringForKey("D2P1R")!, preferences.stringForKey("D2P2R")!, preferences.stringForKey("D2P3R")!, preferences.stringForKey("D2P4R")!],
            [preferences.stringForKey("D1P4R")!, preferences.stringForKey("D1P2R")!, preferences.stringForKey("D1P3R")!, preferences.stringForKey("D1P1R")!],
            [preferences.stringForKey("D2P4R")!, preferences.stringForKey("D2P2R")!, preferences.stringForKey("D2P3R")!, preferences.stringForKey("D2P1R")!],
        ]
    }
    
    func update() {
        if (!dateChanged) {
            dayNumber = dayNum()
        }
        if (dayNumber != 9 && dayNumber != 0) {
            p1 = classes[dayNumber - 1][0]
            p2 = classes[dayNumber - 1][1]
            p3 = classes[dayNumber - 1][2]
            p4 = classes[dayNumber - 1][3]
        } else {
            p1 = "H"
            p2 = "H"
            p3 = "H"
            p4 = "H"
        }
        if (preferences.boolForKey("roomsAdded")) {
            if (dayNumber != 9 && dayNumber != 0) {
                p1R = rooms[dayNumber - 1][0]
                p2R = rooms[dayNumber - 1][1]
                p3R = rooms[dayNumber - 1][2]
                p4R = rooms[dayNumber - 1][3]
            }
        }
    }
    
    func drawSchedule() {
        p1Text.text = p1
        p2Text.text = p2
        p3Text.text = p3
        p4Text.text = p4
        if (dateChanged) {
            todayButton.hidden = false
        } else {
            todayButton.hidden = true
        }
    }
    
    func drawDay() {
        if (dayNumber == 9) {
            dayDisplay.text = "Day: H"
        } else {
            dayDisplay.text = "Day: \(dayNumber)"
        }
    }
    
    func drawRooms() {
        p1Room.text = p1R
        p2Room.text = p2R
        p3Room.text = p3R
        p4Room.text = p4R
    }
    
    func labelSetup() {
        p1Text.clipsToBounds = true
        p2Text.clipsToBounds = true
        p3Text.clipsToBounds = true
        p4Text.clipsToBounds = true
        todayButton.clipsToBounds = true
        p1Text.layer.cornerRadius = 15
        p2Text.layer.cornerRadius = 15
        p3Text.layer.cornerRadius = 15
        p4Text.layer.cornerRadius = 15
        todayButton.layer.cornerRadius = 15
    }
    
    @IBAction func todayPressed(sender: UIButton) {
        dateChanged = false
        update()
        drawSchedule()
        dateDisplay.text = getDate()
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        let datePicker = UIDatePicker()
        textField.inputView = datePicker
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.backgroundColor = UIColor.whiteColor()
        datePicker.addTarget(self, action: #selector(ViewController.datePickerChanged(_:)), forControlEvents: .ValueChanged)
    }
    
    func datePickerChanged(sender: UIDatePicker) {
        dateChanged = true
        let formatter = NSDateFormatter()
        let cal = NSCalendar.currentCalendar()
        let month = cal.component(.Month, fromDate: sender.date)
        let day = cal.component(.Day, fromDate: sender.date)
        dayNumber = schoolYear[month - 1][day]
        update()
        drawSchedule()
        drawDay()
        drawRooms()
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
        if (preferences.stringForKey("D2P4") == nil) {
            self.performSegueWithIdentifier("setup", sender: nil)
        } else {
            buildSchedule()
            buildRooms()
            update()
            drawSchedule()
            drawDay()
            drawRooms()
            p1Room.text = ""
            p2Room.text = ""
            p3Room.text = ""
            p4Room.text = ""
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
        drawDay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

