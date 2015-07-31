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
    //=======================================Helpers=============================//
    /*
    
    FunctionsCoreData.appDel()
    var context:AnyObject = FunctionsCoreData.ManagedObjectContext
    thisObject = FunctionsCoreData.prepareEntity() as! EntityName
    
    
    
    Delete all:
    FunctionsCoreData.deleteData("entityName")
    
    
    */
    //appDel()
    //ManagedObjectContext()
    //saveContext()
    //prepareEntity() as! EntityName
    
//AppDelegate
    func appDel()->AnyObject{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        return appDelegate
    }
//saveContext
    func SaveContextFunction(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.saveContext()
    }
    
//ManagedObjectContext
    func managedObjectContext()->AnyObject{
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
        
        return managedObjectContext
    }
//prepareEntity
    func prepareEntity(entityName:String)->AnyObject{
        
        appDel()
        var context: AnyObject = managedObjectContext()
        let Entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext:context as! NSManagedObjectContext)
        var thisObject: AnyObject = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: self.managedObjectContext() as! NSManagedObjectContext)
        
        return thisObject
    }
//fetchRequest
    func fetchRequest(entName:String)->AnyObject {
        var request = NSFetchRequest(entityName: entName)
        request.returnsObjectsAsFaults = false
        var results:NSArray = managedObjectContext().executeFetchRequest(request, error: nil)!

        return request
    }
    
//fetchedResultsController
    func fetchedResultsController()->AnyObject{
        var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
        
        return fetchedResultsController
    }
    
//executeSaveRequest
    
    func executeSaveRequest(entName:String)->NSArray{
        var request = NSFetchRequest(entityName: entName)
        var error:NSError? = nil
        var results:NSArray = managedObjectContext().executeFetchRequest(request, error: &error)!
        return results
    }

//deleteData
    
    func deleteData(entName:String){
        let managedContext = appDel().managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: entName)
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

}
