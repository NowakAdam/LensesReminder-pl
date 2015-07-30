//
//  Date.swift
//  LensesReminder
//
//  Created by Adam Nowak on 29.07.2015.
//  Copyright (c) 2015 Nowak Adam. All rights reserved.
//

import Foundation
import CoreData

@objc(Date)
class Date: NSManagedObject {

    @NSManaged var date: String
    @NSManaged var changeLensesDate: String
    @NSManaged var dayToAdd: String
}
