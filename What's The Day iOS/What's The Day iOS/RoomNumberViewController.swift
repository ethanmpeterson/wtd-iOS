//
//  RoomNumberViewController.swift
//  WhatsTheDayiOS
//
//  Created by Wojak on 2016-08-31.
//  Copyright © 2016 Wojak. All rights reserved.
//

import UIKit

class RoomNumberViewController: UIViewController {

    @IBOutlet var p1Room: UITextField!
    @IBOutlet var p2Room: UITextField!
    @IBOutlet var p3Room: UITextField!
    @IBOutlet var p4Room: UITextField!
    
    @IBOutlet var p1Label: UILabel!
    @IBOutlet var p2Label: UILabel!
    @IBOutlet var p3Label: UILabel!
    @IBOutlet var p4Label: UILabel!
    
    @IBOutlet var nextButton: UIButton!
    
    let screenSize : CGRect = UIScreen.main.bounds
    var timesPressed : Int = 0
    let preferences = UserDefaults.standard
    var rooomsAdded = false
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController!.navigationBar.barTintColor = UIColor(red: 220.0/255, green: 184.0/255, blue: 72.0/255, alpha: 100.0/100.0)
    }
    
    func labelSetup() {
        p1Label.layer.cornerRadius = 15
        p2Label.layer.cornerRadius = 15
        p3Label.layer.cornerRadius = 15
        p4Label.layer.cornerRadius = 15
        nextButton.layer.cornerRadius = 15
        nextButton.clipsToBounds = true
        p1Label.clipsToBounds = true
        p2Label.clipsToBounds = true
        p3Label.clipsToBounds = true
        p4Label.clipsToBounds = true
    }
    
    func clearText() {
        p1Room.text = nil
        p2Room.text = nil
        p3Room.text = nil
        p4Room.text = nil
    }
    
    func clearLabels() {
        p1Label.text = nil
        p2Label.text = nil
        p3Label.text = nil
        p4Label.text = nil
    }
    
    func displayDayOne() {
        p1Label.text = preferences.string(forKey: "D1P1")
        p2Label.text = preferences.string(forKey: "D1P2")
        p3Label.text = preferences.string(forKey: "D1P3")
        p4Label.text = preferences.string(forKey: "D1P4")
    }
    
    func displayDayTwo() {
        p1Label.text = preferences.string(forKey: "D2P1")
        p2Label.text = preferences.string(forKey: "D2P2")
        p3Label.text = preferences.string(forKey: "D2P3")
        p4Label.text = preferences.string(forKey: "D2P4")
    }
    
    func closeKeyboard() {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closeKeyboard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelSetup()
        NotificationCenter.default.addObserver(self, selector: #selector(SetupViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SetupViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
        displayDayOne()
    }

    @IBAction func nextPressed(_ sender: UIButton) {
        timesPressed += 1
        if (timesPressed == 1) {
            if (p1Room.text != "" && p2Room.text != "" && p3Room.text != "" && p4Room.text != "") {
                nextButton.setTitle("Save & Finish", for: UIControlState())
                preferences.set(p1Room.text, forKey: "D1P1R")
                preferences.set(p2Room.text, forKey: "D1P2R")
                preferences.set(p3Room.text, forKey: "D1P3R")
                preferences.set(p4Room.text, forKey: "D1P4R")
                closeKeyboard()
                clearText()
                displayDayTwo()
            } else {
                timesPressed -= 1
            }
        }
        if (timesPressed == 2) {
            if (p1Room.text != "" && p2Room.text != "" && p3Room.text != "" && p4Room.text != "") {
                nextButton.setTitle("Save & Finish", for: UIControlState())
                preferences.set(p1Room.text, forKey: "D2P1R")
                preferences.set(p2Room.text, forKey: "D2P2R")
                preferences.set(p3Room.text, forKey: "D2P3R")
                preferences.set(p4Room.text, forKey: "D2P4R")
                preferences.set(true, forKey: "roomsAdded")
                closeKeyboard()
                let didSave = preferences.synchronize()
                if (!didSave) { // runs if save failed
                    
                }
                self.performSegue(withIdentifier: "rooms", sender: nil)
            } else {
                timesPressed -= 1
            }
        }
    }
    
    func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if (screenSize.height != 736 && screenSize.width != 414) {
                if (p3Room.isEditing || p4Room.isEditing) {
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
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
