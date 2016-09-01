//
//  SettingsViewController.swift
//  WhatsTheDayiOS
//
//  Created by Wojak on 2016-08-16.
//  Copyright © 2016 Wojak. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController!.navigationBar.barTintColor = UIColor(red: 28.0/255, green: 63.0/255, blue: 148.0/255, alpha: 100.0/100.0)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .Plain, target: nil, action: nil)
        //self.view.translatesAutoresizingMaskIntoConstraints = false
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
