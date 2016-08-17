//
//  SetupViewController.swift
//  What's The Day iOS
//
//  Created by Wojak on 2016-08-10.
//  Copyright © 2016 Wojak. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {
    
    
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
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        closeKeyboard()
    }
    
    
    @IBAction func nextPressed(sender: UIButton) {
        timesPressed++
        print(p1Input.text)
        let preferences = NSUserDefaults.standardUserDefaults()
        if (timesPressed == 1) {
            if (p1Input.text != "" && p2Input.text != "" && p3Input.text != "" && p4Input.text != "") {
                setupLabel.text = "Enter Your Day 2 Classes Below:"
                nextButton.setTitle("Save and Finish", forState: UIControlState.Normal)
            } else {
                timesPressed--
            }
        } else if (timesPressed == 2) {
            if (p1Input.text != "" && p2Input.text != "" && p3Input.text != "" && p4Input.text != "") {
                preferences.setValue(p1Input.text, forKey: "D2P1")
                preferences.setValue(p2Input.text, forKey: "D2P2")
                preferences.setValue(p3Input.text, forKey: "D2P3")
                preferences.setValue(p4Input.text, forKey: "D2P4")
            } else {
                timesPressed-- // reduce timespressed by 1 to ensure it does not exceed the value being checked for of two
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil) // removes back button
        navigationItem.leftBarButtonItem = backButton
        // style next button
        //nextButton.backgroundColor = UIColor.clearColor()
        nextButton.layer.cornerRadius = 10
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.blackColor().CGColor
        // style naviagation bar to use yellow color of RSGC
        navigationController!.navigationBar.barTintColor = UIColor(red: 220.0/255, green: 184.0/255, blue: 72.0/255, alpha: 100.0/100.0)
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
