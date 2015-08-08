//
//  dateFormatter.swift
//  LensesReminder
//
//  Created by Adam Nowak on 31.07.2015.
//  Copyright (c) 2015 Nowak Adam. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DateForm{
    
    func dateFormString(StringDate:String)->NSDate{
        let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let convertedDate = dateFormatter.dateFromString(StringDate)
        
        return convertedDate!
    }
    
    func dateToString(dateNSdate:NSDate) -> String{
            let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
            let strDate = dateFormatter.stringFromDate(dateNSdate)

        return strDate
    }
//    func addOneHour(hoursToAdd:Int, expireDate:NSDate)->NSDate{
//        
//        var hourComponent = NSDateComponents()
//            hourComponent.minute = hoursToAdd
//        var theCalendar = NSCalendar.currentCalendar()
//        var dateToRemind = theCalendar.dateByAddingComponents(hourComponent, toDate: expireDate, options: nil)
//        return dateToRemind!
//    }
}