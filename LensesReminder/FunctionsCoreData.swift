//
//  FunctionsCoreData.swift
//  LensesReminder
//
//  Created by Adam Nowak on 30.07.2015.
//  Copyright (c) 2015 Nowak Adam. All rights reserved.
//

import UIKit
import CoreData

class FunctionsCoreData: UIViewController,NSFetchedResultsControllerDelegate {
    /*
    *******saveData*******
    FunctionsCoreData.appDel()
    var context:AnyObject = FunctionsCoreData.ManagedObjectContext()
    thisObject = FunctionsCoreData.prepareEntity() as! EntityName
    example:
    
    thisObject.properity = UITextfield.text
    FunctionsCoreData.SaveContextFunction()
    let results:NSArray = FunctionsCoreData.executeRequest("EntityName")
    for res in results{
        objectArray.append(thisObject)
    }
    
    *******Delete all:*******
    FunctionsCoreData.deleteData("entityName")
    
    *******Show Data:*******
    FunctionsCoreData.appDel()
    let request: AnyObject = functions.fetchRequest("entityName")
    let results: AnyObject = functions.executeRequest("entityName")
    example :
    
    if (results.count > 0){
    var counter = (results.count - 1 )
    var res = results[counter] as! NSManagedObject
    var keysArray = ["key"]
    dal_right_sfera.text =  res.valueForKey("key") as? String
    }
    
    TODO:
    *******EditData:*******

    
    */
    
    func appDel()->AnyObject{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        return appDelegate
    }

    func SaveContextFunction(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.saveContext()
    }
    
    func managedObjectContext()->AnyObject{
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
        
        return managedObjectContext
    }

    func prepareEntity(entityName:String)->AnyObject{
        
        appDel()
        var context: AnyObject = managedObjectContext()
        let Entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext:context as! NSManagedObjectContext)
        var thisObject: AnyObject = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: self.managedObjectContext() as! NSManagedObjectContext)
        
        return thisObject
    }

    func fetchRequest(entName:String)->AnyObject {
        var request = NSFetchRequest(entityName: entName)
        request.returnsObjectsAsFaults = false
        var results:NSArray = managedObjectContext().executeFetchRequest(request, error: nil)!

        return request
    }
    
    func executeRequest(entName:String)->NSArray{
        var request = NSFetchRequest(entityName: entName)
        var error:NSError? = nil
        var results:NSArray = managedObjectContext().executeFetchRequest(request, error: &error)!
        
        return results
    }
    
    func fetchedResultsController()->AnyObject{
        var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
        
        return fetchedResultsController
    }

    func deleteData(entName:String){
        let managedContext = appDel().managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: entName)
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error)
            as! [NSManagedObject]?
        if let results = fetchedResults {
            for (var i=0; i < results.count; i++)
            {
                let value = results[i]
                managedContext.deleteObject(value)
                managedContext.save(nil)
            }
        }
    }
//    func editDataByKey(entityName:String,key:String,newValue:NSDate){
//      
//        var thisObject: AnyObject = prepareEntity(entityName)
//        var dataToDelete: NSManagedObject? = thisObject.valueForKey(key) as! NSManagedObject?
//        var error: NSError?
//        let managedContext = appDel().managedObjectContext!
//        let fetchRequest = NSFetchRequest(entityName: entityName)
//
//        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error)
//            as! [NSManagedObject]?
//        if let results = fetchedResults {
//            for (var i=0; i < results.count; i++)
//            {
//                let value = results[i]
//                managedContext.deleteObject(dataToDelete!)
//                managedContext.save(nil)
//            }
//        }
//    }
}
