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
    
    let screenSize : CGRect = UIScreen.mainScreen().bounds
    var timesPressed : Int = 0
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIApplication.sharedApplication().statusBarStyle = .LightContent
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
    
    func closeKeyboard() {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        closeKeyboard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelSetup()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SetupViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SetupViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }

    @IBAction func nextPressed(sender: UIButton) {
        
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            if (screenSize.height != 736 && screenSize.width != 414) {
                if (p3Room.editing || p4Room.editing) {
                    if view.frame.origin.y == 0 {
                        self.view.frame.origin.y -= keyboardSize.height
                    }
                }
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
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
