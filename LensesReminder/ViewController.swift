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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//usuwanie danych z CoreData
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

    }


