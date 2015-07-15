//
//  Lenses.swift
//  LensesReminder
//
//  Created by Adam Nowak on 14.07.2015.
//  Copyright (c) 2015 Nowak Adam. All rights reserved.
//

import Foundation
import CoreData

@objc(Lenses)
class Lenses: NSManagedObject {

    @NSManaged var bliz_left_cylinder: String
    @NSManaged var bliz_left_os: String
    @NSManaged var bliz_left_pryzma: String
    @NSManaged var bliz_left_sfera: String
    @NSManaged var dal_left_cylinder: String
    @NSManaged var dal_left_os: String
    @NSManaged var dal_left_pryzma: String
    @NSManaged var dal_left_sfera: String
    @NSManaged var dal_right_sfera: String
    @NSManaged var dal_right_cylinder: String
    @NSManaged var dal_right_os: String
    @NSManaged var dal_right_pryzma: String
    @NSManaged var bliz_right_cylinder: String
    @NSManaged var bliz_right_os: String
    @NSManaged var bliz_right_pryzma: String
    @NSManaged var bliz_right_sfera: String

}
