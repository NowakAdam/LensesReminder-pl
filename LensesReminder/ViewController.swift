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
    var dateArray = [NSManagedObject]()
    var dateForm = DateForm()
    var functions = FunctionsCoreData()
    var sysinfo = CheckSystem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
          self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
       
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"dataPick", name: "actionTwoPressed", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"remind", name: "actionThreePressed", object: nil)
    }
    override func viewDidAppear(animated: Bool) {
        showDate()
        helpMeNow()
        
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
            
            if sysinfo.checkSystem() == 7{
                alertiOS7(expireDateToAlert)
            } else {
                alert(expireDateToAlert)
            }
        }
    }
    func alert(expireDate:NSDate){
        var notification:UILocalNotification = UILocalNotification()
        notification.category = "FirstCat"
        notification.alertBody = "Soczewki straciły ważność"
        notification.fireDate = expireDate
        notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func alertiOS7(expireDate:NSDate){

        let alert = UIAlertView()
        alert.title = "Błąd!"
        alert.message = "Twój system to iOS \(sysinfo.checkSystem()), powiadomienia nie będą działały, uaktualnij swój system do iOS 8"
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    func dataPick(){
        self.performSegueWithIdentifier("DataPickerView", sender: nil)
    }
    func remind(){
        
        var hourComponent = NSDateComponents()
        hourComponent.minute = 1
        var theCalendar = NSCalendar.currentCalendar()
        var dateToRemind = theCalendar.dateByAddingComponents(hourComponent, toDate: returnExpireDate(), options: nil)
        dateForm.dateToString(dateToRemind!)
            println(dateForm.dateToString(dateToRemind!))
       helpMeNow()
          
    }
    func setExpireDate(expireDate:AnyObject){
        functions.appDel()
        functions.fetchRequest("Date")
        var results: NSArray = functions.executeRequest("Date")
        if (results.count > 0) {
        var res = results[0] as! NSManagedObject
        var keyDateExpire = "changeLensesDate"
            functions.appDel()
        var context:AnyObject = functions.managedObjectContext()
        var thisObj = functions.prepareEntity("Date") as! Date
        thisObj.changeLensesDate = expireDate as! String
            
            functions.SaveContextFunction()
            println(returnExpireDate())
        }
    }
    func returnExpireDate()->NSDate{
        functions.appDel()
        functions.fetchRequest("Date")
        var results: NSArray = functions.executeRequest("Date")
        if (results.count > 0) {
            var res = results[0] as! NSManagedObject
            var keyDateExpire = "changeLensesDate"
            var dateToLabel = res.valueForKey(keyDateExpire) as? String
            let expireDateToAlert = dateForm.dateFormString(dateToLabel!)
            return expireDateToAlert
        } else{
        return NSDate()
        }
    }

    func helpMeNow(){
        let request: AnyObject = functions.fetchRequest("Date")
        let results: NSArray = functions.executeRequest("Date")
        
        if (results.count > 0){
            
            var date: AnyObject? = results.valueForKey("changeLensesDate")
            var date2:AnyObject? = results.valueForKey("date")
            
         println(date)
                
            }
        
        }
        

    }
       
        




