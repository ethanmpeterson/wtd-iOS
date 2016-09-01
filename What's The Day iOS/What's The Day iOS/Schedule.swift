//
//  Schedule.swift
//  WhatsTheDayiOS
//
//  Created by DMAAdmin on 8/18/16.
//  Copyright © 2016 Wojak. All rights reserved.
//

import Foundation

class Schedule : NSObject {
    
    // day 1 strings
    var d1p1 : String!
    var d1p2 : String!
    var d1p3 : String!
    var d1p4 : String!
    
    // day 2 strings
    var d2p1 : String!
    var d2p2 : String!
    var d2p3 : String!
    var d2p4 : String!
    
    // room Strings
    var p1Room : String!
    var p2Room : String!
    var p3Room : String!
    var p4Room : String!
    
    override init() { // constructor for main schedule
    }
    
    func enterDayOne(p1Class : String, p2Class : String, p3Class : String, p4Class : String) {
        d1p1 = p1Class
        d1p2 = p2Class
        d1p3 = p3Class
        d1p4 = p4Class
    }
    
    func enterDayTwo(p1Class : String, p2Class : String, p3Class : String, p4Class : String) {
        d2p1 = p1Class
        d2p2 = p2Class
        d2p3 = p3Class
        d2p4 = p4Class
    }
    
    func make(s : Schedule) -> Schedule {
        return s
    }
}