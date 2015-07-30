//
//  ShowRecipeView.swift
//  LensesReminder
//
//  Created by Adam Nowak on 13.07.2015.
//  Copyright (c) 2015 Nowak Adam. All rights reserved.
//

import UIKit
import CoreData

class ShowRecipeView: UIViewController,NSFetchedResultsControllerDelegate {
    
    //labels
    @IBOutlet weak var dal_right_sfera: UILabel!
    @IBOutlet weak var dal_right_cylinder: UILabel!
    @IBOutlet weak var dal_right_os: UILabel!
    @IBOutlet weak var dal_right_pryzma: UILabel!
    @IBOutlet weak var dal_left_sfera: UILabel!
    @IBOutlet weak var dal_left_cylinder: UILabel!
    @IBOutlet weak var dal_left_os: UILabel!
    @IBOutlet weak var dal_left_pryzma: UILabel!
    @IBOutlet weak var bliz_right_sfera: UILabel!
    @IBOutlet weak var bliz_right_cylinder: UILabel!
    @IBOutlet weak var bliz_right_os: UILabel!
    @IBOutlet weak var bliz_right_pryzma: UILabel!
    @IBOutlet weak var bliz_left_sfera: UILabel!
    @IBOutlet weak var bliz_left_cylinder: UILabel!
    @IBOutlet weak var bliz_left_os: UILabel!
    @IBOutlet weak var bliz_left_pryzma: UILabel!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context :NSManagedObjectContext = appDel.managedObjectContext!
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
        }else {
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
