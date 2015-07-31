//
//  ViewController.swift
//  LensesReminder
//
//  Created by Adam Nowak on 09.07.2015.
//  Copyright (c) 2015 Nowak Adam. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var fillRecipeButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var expireInfoLabel: UILabel!
    
    var dateForm = DateForm()
    var functions = FunctionsCoreData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(animated: Bool) {
        showDate()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func clearCoreDataButtonTapped(sender: UIButton) {

        functions.deleteData("Lenses")
    }

//helper

    func showDate(){
        functions.appDel()
        functions.fetchRequest("Date")
        var results: NSArray = functions.executeRequest("Date")
        
        if (results.count > 0) {
            var res = results[0] as! NSManagedObject
            var keyDate = "date"
            var keyDateExpire = "changeLensesDate"
            var dateToLabel = res.valueForKey(keyDate) as? String
            var expireDateToLabel = res.valueForKey(keyDateExpire) as? String
            let expireDateToAlert = dateForm.dateFormString(expireDateToLabel!)
            self.infoLabel.text = "zakup dnia " + dateToLabel!
            self.expireInfoLabel.text = "soczewki ważne do: " + expireDateToLabel!
            alert(expireDateToAlert)
        }
    }
    func alert(expireDate:AnyObject){
        var notification:UILocalNotification = UILocalNotification()
        notification.category = "FirstCat"
        notification.alertBody = "Soczewki straciły ważność"
        notification.fireDate = expireDate as? NSDate
        notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
}


