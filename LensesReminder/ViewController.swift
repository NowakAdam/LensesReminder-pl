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
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     showDate()

   
    }
    override func viewDidAppear(animated: Bool) {
           showDate()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func clearCoreDataButtonTapped(sender: UIButton) {
        delete()
    }

//helper
    
    func delete(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "Lenses")
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error)
            as! [NSManagedObject]?
        if let results = fetchedResults
        {
            for (var i=0; i < results.count; i++)
            {
                let value = results[i]
                managedContext.deleteObject(value)
                managedContext.save(nil)
            }
        }
    }
    func showDate(){
        let appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        var request = NSFetchRequest(entityName: "Date")
        request.returnsObjectsAsFaults = false
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        if (results.count > 0) {
            var res = results[0] as! NSManagedObject
            var keyDate = "date"
            var keyDateExpire = "changeLensesDate"
            var dateToLabel = res.valueForKey(keyDate) as? String
            var expireDateToLabel = res.valueForKey(keyDateExpire) as? String
            
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
            let expireDateToAlert = dateFormatter.dateFromString(expireDateToLabel!)
            
            
            
            self.infoLabel.text = "zakup dnia " + dateToLabel!
            self.expireInfoLabel.text = "soczewki ważne do: " + expireDateToLabel!
            alert(expireDateToAlert!)
            if expireDateToAlert != nil{
               
            
            }
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


