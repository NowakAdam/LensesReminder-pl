//
//  editRecipeView.swift
//  LensesReminder
//
//  Created by Adam Nowak on 15.07.2015.
//  Copyright (c) 2015 Nowak Adam. All rights reserved.
//

import UIKit
import CoreData

class editRecipeView: UIViewController, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var zapisanoLabel: UILabel!
    @IBOutlet weak var dal_right_sfera: UITextField!
    @IBOutlet weak var dal_right_cylinder: UITextField!
    @IBOutlet weak var dal_right_os: UITextField!
    @IBOutlet weak var dal_right_pryzma: UITextField!
    @IBOutlet weak var dal_left_sfera: UITextField!
    @IBOutlet weak var dal_left_cylinder: UITextField!
    @IBOutlet weak var dal_left_os: UITextField!
    @IBOutlet weak var dal_left_pryzma: UITextField!
    @IBOutlet weak var bliz_right_sfera: UITextField!
    @IBOutlet weak var bliz_right_cylinder: UITextField!
    @IBOutlet weak var bliz_right_os: UITextField!
    @IBOutlet weak var bliz_right_pryzma: UITextField!
    @IBOutlet weak var bliz_left_sfera: UITextField!
    @IBOutlet weak var bliz_left_cylinder: UITextField!
    @IBOutlet weak var bliz_left_os: UITextField!
    @IBOutlet weak var bliz_left_pryzma: UITextField!
    
    var lensesarray = [NSManagedObject]()
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMainView()
           }
    @IBAction func SaveEditButtonTapped(sender: UIButton) {
        delete()
        saveData()
        updateMainView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //helpers
    
    func saveData(){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        let lensesEntity = NSEntityDescription.entityForName("Lenses", inManagedObjectContext:context)
        var thisLense = NSEntityDescription.insertNewObjectForEntityForName("Lenses", inManagedObjectContext: self.managedObjectContext) as! Lenses
        
        thisLense.dal_right_sfera = dal_right_sfera.text
        thisLense.dal_right_cylinder = dal_right_cylinder.text
        thisLense.dal_right_os = dal_right_os.text
        thisLense.dal_right_pryzma = dal_right_pryzma.text
        thisLense.dal_left_sfera = dal_left_sfera.text
        thisLense.dal_left_cylinder = dal_left_cylinder.text
        thisLense.dal_left_os = dal_left_os.text
        thisLense.dal_left_pryzma = dal_left_pryzma.text
        thisLense.bliz_left_sfera = bliz_left_sfera.text
        thisLense.bliz_left_cylinder = bliz_left_cylinder.text
        thisLense.bliz_left_os = bliz_left_os.text
        thisLense.bliz_left_pryzma = bliz_left_pryzma.text
        thisLense.bliz_right_sfera = bliz_right_sfera.text
        thisLense.bliz_right_cylinder = bliz_right_cylinder.text
        thisLense.bliz_right_os = bliz_right_os.text
        thisLense.bliz_right_pryzma = bliz_right_pryzma.text
        
        appDel.saveContext()
        
        var request = NSFetchRequest(entityName: "Lenses")
        var error:NSError? = nil
        var results:NSArray = managedObjectContext.executeFetchRequest(request, error: &error)!
        
        for res in results {
            lensesarray.append(thisLense)
            zapisanoLabel.text = "Zapisano!"
        }
    }
    
    func updateMainView(){
        let appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        var request = NSFetchRequest(entityName: "Lenses")
        request.returnsObjectsAsFaults = false
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        
        if (results.count > 0){
            var counter = (results.count - 1 )
            var res = results[counter] as! NSManagedObject
            var keysArray = ["dal_right_sfera","dal_right_cylinder","dal_right_os","dal_right_pryzma","dal_left_sfera","dal_left_cylinder","dal_left_os","bliz_left_sfera","bliz_left_cylinder","bliz_left_os","bliz_left_pryzma","bliz_right_sfera","bliz_right_cylinder","bliz_right_os","bliz_right_pryzma"]
            
            dal_right_sfera.text =  res.valueForKey("dal_right_sfera") as? String
            dal_right_cylinder.text = res.valueForKey("dal_right_cylinder") as? String
            dal_right_os.text = res.valueForKey("dal_right_os") as? String
            dal_right_pryzma.text = res.valueForKey("dal_right_pryzma") as? String
            dal_left_sfera.text = res.valueForKey("dal_left_sfera") as? String
            dal_left_cylinder.text = res.valueForKey("dal_left_cylinder") as? String
            dal_left_os.text = res.valueForKey("dal_left_os") as? String
            dal_left_pryzma.text = res.valueForKey("dal_left_pryzma") as? String
            bliz_right_sfera.text = res.valueForKey("bliz_right_sfera") as? String
            bliz_right_cylinder.text = res.valueForKey("bliz_right_cylinder") as? String
            bliz_right_os.text = res.valueForKey("bliz_right_os") as? String
            bliz_right_pryzma.text = res.valueForKey("bliz_right_pryzma") as? String
            bliz_left_sfera.text = res.valueForKey("bliz_left_sfera") as? String
            bliz_left_cylinder.text = res.valueForKey("bliz_left_cylinder") as? String
            bliz_left_os.text = res.valueForKey("bliz_left_os") as? String
            bliz_left_pryzma.text = res.valueForKey("bliz_left_pryzma") as? String
        }
        else {
            zapisanoLabel.text = "Brak Danych"
            dal_right_sfera.text = "B/D"
            dal_right_cylinder.text = "B/D"
            dal_right_os.text = "B/D"
            dal_right_pryzma.text = "B/D"
            dal_left_sfera.text = "B/D"
            dal_left_cylinder.text = "B/D"
            dal_left_os.text = "B/D"
            dal_left_pryzma.text = "B/D"
            bliz_right_sfera.text = "B/D"
            bliz_right_cylinder.text = "B/D"
            bliz_right_os.text = "B/D"
            bliz_right_pryzma.text = "B/D"
            bliz_left_sfera.text = "B/D"
            bliz_left_cylinder.text = "B/D"
            bliz_left_os.text = "B/D"
            bliz_left_pryzma.text = "B/D"
        }
    }
    
    func delete(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "Lenses")
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error)
            as! [NSManagedObject]?
        if let results = fetchedResults {
            for (var i=0; i < results.count; i++) {
                let value = results[i]
                managedContext.deleteObject(value)
                managedContext.save(nil)
            }
        }
    }
}