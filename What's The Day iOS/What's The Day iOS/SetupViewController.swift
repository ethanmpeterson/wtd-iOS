//
//  SetupViewController.swift
//  What's The Day iOS
//
//  Created by Wojak on 2016-08-10.
//  Copyright © 2016 Wojak. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController, UITextViewDelegate {
    
    let screenSize : CGRect = UIScreen.main.bounds
    let preferences = UserDefaults.standard
    var schedule : Schedule!
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var setupLabel: UILabel!
    @IBOutlet var p1Input: UITextField!
    @IBOutlet var p2Input: UITextField!
    @IBOutlet var p3Input: UITextField!
    @IBOutlet var p4Input: UITextField!
    var timesPressed = 0
    var setupComplete = false
    
    
    func closeKeyboard() {
        self.view.endEditing(true)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closeKeyboard()
    }
    
    func saveSchedule(_ dayNumber : Int) {
        if (dayNumber == 1) {
            schedule.enterDayOne(p1Input.text!, p2Class: p2Input.text!, p3Class: p3Input.text!, p4Class: p4Input.text!)
            preferences.setValue(p1Input.text, forKey: "D1P1")
            preferences.setValue(p2Input.text, forKey: "D1P2")
            preferences.setValue(p3Input.text, forKey: "D1P3")
            preferences.setValue(p4Input.text, forKey: "D1P4")
        } else if (dayNumber == 2) {
            //schedule.enterDayTwo(p1Input.text!, p2Class: p2Input.text!, p3Class: p3Input.text!, p4Class: p4Input.text!)
            preferences.setValue(p1Input.text, forKey: "D2P1")
            preferences.setValue(p2Input.text, forKey: "D2P2")
            preferences.setValue(p3Input.text, forKey: "D2P3")
            preferences.setValue(p4Input.text, forKey: "D2P4")
        }
        //let encodedData = NSKeyedArchiver.archivedDataWithRootObject(schedule)
        //preferences.setObject(encodedData, forKey: "schedule")
        let didSave = preferences.synchronize()
        if (!didSave) { // runs if save failed (does not seem to happen in testing)
        }
    }
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        timesPressed += 1
        closeKeyboard()
        print(p1Input.text)
        if (timesPressed == 1) {
            if (p1Input.text != "" && p2Input.text != "" && p3Input.text != "" && p4Input.text != "") {
                setupLabel.text = "Enter Your Day 2 Classes Below:"
                nextButton.setTitle("Save and Finish", for: UIControlState())
                saveSchedule(1)
                p1Input.text = ""
                p2Input.text = ""
                p3Input.text = ""
                p4Input.text = ""
            } else {
                timesPressed -= 1
            }
        } else if (timesPressed == 2) {
            if (p1Input.text != "" && p2Input.text != "" && p3Input.text != "" && p4Input.text != "") {
                saveSchedule(2)
                preferences.set(true, forKey: "setupComplete")
                self.performSegue(withIdentifier: "schedule", sender: nil)
            } else {
                timesPressed -= 1 // reduce timespressed by 1 to ensure it does not exceed the value being checked for of two
            }
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        UIApplication.shared.statusBarStyle = .lightContent
        if (preferences.bool(forKey: "setupComplete") == false) {
            let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil) // removes back button
            navigationItem.leftBarButtonItem = backButton
        }
        // Handle iPad scaling issues
        if (screenSize.width == 320.0 && screenSize.height == 480.0) {
            for constraint in self.view.constraints {
                if (constraint.identifier == "c0") {
                   constraint.constant = 10
                }
                if (constraint.identifier == "c1") {
                    constraint.constant = 10
                }
                if (constraint.identifier == "c2") {
                    constraint.constant = 40
                }
                if (constraint.identifier == "c3") {
                    constraint.constant = 70
                }
                if (constraint.identifier == "c4") {
                    constraint.constant = 40
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schedule = Schedule()
        NotificationCenter.default.addObserver(self, selector: #selector(SetupViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SetupViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // style next button
        nextButton.layer.cornerRadius = 15
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.black.cgColor
        // style naviagation bar to use yellow color of RSGC
        navigationController!.navigationBar.barTintColor = UIColor(red: 220.0/255, green: 184.0/255, blue: 72.0/255, alpha: 100.0/100.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if (screenSize.height != 736 && screenSize.width != 414) {
                if (p3Input.isEditing || p4Input.isEditing) {
                    if view.frame.origin.y == 0 {
                        self.view.frame.origin.y -= keyboardSize.height
                    }
                }
            }
        }
    }
    
    func keyboardWillHide(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0 //+= keyboardSize.height
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
