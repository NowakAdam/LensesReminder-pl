//
//  checkSystem.swift
//  LensesReminder
//
//  Created by Adam Nowak on 04.08.2015.
//  Copyright (c) 2015 Nowak Adam. All rights reserved.
//

import Foundation
import UIKit

class CheckSystem {
    
    func checkSystem()->Int{
        return String(Array(UIDevice.currentDevice().systemVersion)[0]).toInt()!
    }
}
