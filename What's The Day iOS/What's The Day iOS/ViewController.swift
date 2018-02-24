//
//  ViewController.swift
//  What's The Day iOS
//
//  Created by Wojak on 2016-08-09.
//  Copyright © 2016 Wojak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
//    let schoolYear : [[Int]] = [
//        [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2, 3], // January
//        [9, 4, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 9, 9, 9, 9, 4, 1, 2, 3, 9, 9, 4, 1],           // February
//        [9, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 2, 3, 4, 1],  // March
//        [9, 9, 9, 2, 3, 4, 1, 2, 9, 9, 3, 4, 1, 2, 9, 9, 9, 9, 3, 4, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9],   // April
//        [9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9, 9, 3, 4, 1, 2, 9, 9, 3, 4, 1], // May
//        [9, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],    // June
//        [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],   // July
//        [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],   // August
//        [9, 9, 9, 9, 9, 9, 9, 0, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 0, 9, 9, 4, 1, 2, 3, 4],  // September
//        [9, 9, 9, 1, 2, 3, 4, 1, 9, 9, 0, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4], // October
//        [9, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 9, 9, 9, 9, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2, 3, 4],    // November
//        [9, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9], // December
//    ] // Day Calendar 2016 - 2017
    let schoolYear : [[Int]] = [
        [9, 9, 9, 9, 9, 9, 9, 9, 0, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2, 3, 4], //january
        [9, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 9, 9, 9, 9, 4, 1, 2, 3, 9, 9, 4, 1, 2], //february
        [9, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 2, 3, 4, /*1*/ 5, 9, 9], //march
        [9, 9, 9, /*2*/ 6, /*3*/ 7, /*4*/ 8, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1], //april
        [9, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 9, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3], // may
        [9, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9], //june
        [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9], // july
        [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9], //august
        [9, 9, 9, 9, 9, 9, 0, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 9, 9, 9, 4, 1, 2, 3, 4, 9], // september
        [9, 9, 1, 2, 3, 4, 1, 9, 9, 9, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1], //october
        [9, 2, 3, 4, 9, 9, 1, 2, 3, 4, 9, 9, 9, 9, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1], //november
        [9, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9] //december
    ] // Day Calendar 2017 - 2018

    let preferences = UserDefaults.standard
    
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
    
    let p1Time = "  (8:15 - 9:30 AM)"
    let p2Time = "  (9:35 - 10:50 AM)"
    let p3Time = "  (11:15 AM - 12:30 PM)"
    let p4Time = "  (1:25 - 2:40 PM)"
    
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
    var dayNumber : Int = 0
    var dateChanged = false
    
    func month() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.month, from: date)
        let month = components.month
        
        return month!
    }
    
    func day() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.day, from: date)
        let day = components.day
        
        return day!
    }
    

    func getDate() -> String {
        let formatter = DateFormatter()
        let date = Date()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
    
    func dayNum() -> Int {
        return schoolYear[month() - 1][day()]
    }
    
    func closeKeyboard() {
        self.view.endEditing(true)
    }
    
    func buildSchedule() {
        classes = [
            [preferences.string(forKey: "D1P1")!, preferences.string(forKey: "D1P2")!, preferences.string(forKey: "D1P3")!, preferences.string(forKey: "D1P4")!],
            
            [preferences.string(forKey: "D2P1")!, preferences.string(forKey: "D2P2")!, preferences.string(forKey: "D2P3")!, preferences.string(forKey: "D2P4")!],
            
            [preferences.string(forKey: "D1P4")!, preferences.string(forKey: "D1P2")!, preferences.string(forKey: "D1P3")!, preferences.string(forKey: "D1P1")!],
            
            [preferences.string(forKey: "D2P4")!, preferences.string(forKey: "D2P2")!, preferences.string(forKey: "D2P3")!, preferences.string(forKey: "D2P1")!],
            
            [preferences.string(forKey: "D1P3")!, preferences.string(forKey: "D1P4")!, preferences.string(forKey: "D1P1")!, preferences.string(forKey: "D1P2")!],
            
            [preferences.string(forKey: "D2P3")!, preferences.string(forKey: "D2P4")!, preferences.string(forKey: "D2P1")!, preferences.string(forKey: "D2P2")!],
            
            [preferences.string(forKey: "D1P4")!, preferences.string(forKey: "D1P1")!, preferences.string(forKey: "D1P2")!, preferences.string(forKey: "D1P3")!],
            
            [preferences.string(forKey: "D2P4")!, preferences.string(forKey: "D2P1")!, preferences.string(forKey: "D2P2")!, preferences.string(forKey: "D2P3")!]
        ]
    }
    
    func buildRooms() {
        rooms = [
            [preferences.string(forKey: "D1P1R")!, preferences.string(forKey: "D1P2R")!, preferences.string(forKey: "D1P3R")!, preferences.string(forKey: "D1P4R")!],
            
            [preferences.string(forKey: "D2P1R")!, preferences.string(forKey: "D2P2R")!, preferences.string(forKey: "D2P3R")!, preferences.string(forKey: "D2P4R")!],
            
            [preferences.string(forKey: "D1P4R")!, preferences.string(forKey: "D1P2R")!, preferences.string(forKey: "D1P3R")!, preferences.string(forKey: "D1P1R")!],
            
            [preferences.string(forKey: "D2P4R")!, preferences.string(forKey: "D2P2R")!, preferences.string(forKey: "D2P3R")!, preferences.string(forKey: "D2P1R")!],
        ]
    }
    
    func update() {
        if (!dateChanged) {
            dayNumber = dayNum()
        }
        if (dayNumber != 9 && dayNumber != 0) {
            p1 = classes[dayNumber - 1][0] //+ String(p1Time)
            p2 = classes[dayNumber - 1][1]
            p3 = classes[dayNumber - 1][2]
            p4 = classes[dayNumber - 1][3]
        } else {
            p1 = "H"
            p2 = "H"
            p3 = "H"
            p4 = "H"
        }
        if (preferences.bool(forKey: "roomsAdded")) {
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
            todayButton.isHidden = false
        } else {
            todayButton.isHidden = true
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
    
    @IBAction func todayPressed(_ sender: UIButton) {
        dateChanged = false
        update()
        drawSchedule()
        drawDay()
        dateDisplay.text = getDate()
        closeKeyboard()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePicker = UIDatePicker()
        textField.inputView = datePicker
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.backgroundColor = UIColor.white
        datePicker.addTarget(self, action: #selector(ViewController.datePickerChanged(_:)), for: .valueChanged)
    }
    
    func datePickerChanged(_ sender: UIDatePicker) {
        dateChanged = true
        let formatter = DateFormatter()
        let cal = Calendar.current
        let month = (cal as NSCalendar).component(.month, from: sender.date)
        let day = (cal as NSCalendar).component(.day, from: sender.date)
        dayNumber = schoolYear[month - 1][day]
        update()
        drawSchedule()
        drawDay()
        drawRooms()
        formatter.dateStyle = .long
        dateDisplay.text = formatter.string(from: sender.date)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dateDisplay.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closeKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (preferences.string(forKey: "D2P4") == nil) {
            self.performSegue(withIdentifier: "setup", sender: nil)
        } else {
            buildSchedule()
            update()
            drawSchedule()
            drawDay()
            p1Room.text = ""
            p2Room.text = ""
            p3Room.text = ""
            p4Room.text = ""
        }
        if (preferences.bool(forKey: "roomsAdded")) {
            buildRooms()
            drawRooms()
        }
        // style view
        navigationController!.navigationBar.barTintColor = UIColor(red: 28.0/255, green: 63.0/255, blue: 148.0/255, alpha: 100.0/100.0)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        UIApplication.shared.statusBarStyle = .lightContent
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
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

