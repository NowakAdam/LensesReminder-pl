//
//  Lenses.swift
//  LensesReminder
//
//  Created by Adam Nowak on 10.07.2015.
//  Copyright (c) 2015 Nowak Adam. All rights reserved.
//

import Foundation
import CoreData

@objc(Lenses)
class Lenses: NSManagedObject {

    @NSManaged var dal_sfera: String
    @NSManaged var dal_cylinder: String
    @NSManaged var dal_os: String
    @NSManaged var dal_pryzma: String
    @NSManaged var bliz_cylinder: String
    @NSManaged var bliz_os: String
    @NSManaged var bliz_pryzma: String
    @NSManaged var bliz_sfera: String

}
