//
//  DataPickerView.swift
//  LensesReminder
//
//  Created by Adam Nowak on 27.07.2015.
//  Copyright (c) 2015 Nowak Adam. All rights reserved.
//

import UIKit
import CoreData

class DataPickerView: UIViewController {
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var selectedDate: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperInfoLabel: UILabel!
    var stepValue = ""
    
    
    @IBAction func stepperValueChange(sender: AnyObject) {
        
        var step : UIStepper = sender as! UIStepper
        var stepVal = step.value.description
        
       stepValue = getStepValue(stepVal)
        
        if  stepVal == "1.0" {
            stepperInfoLabel.text = "jednodniowe"
        } else if stepVal == "2.0" {
            stepperInfoLabel.text = "dwutygodniowe"
        } else if stepVal == "3.0" {
            stepperInfoLabel.text = "miesieczne"
        } else if stepVal == "4.0" {
            stepperInfoLabel.text = "trzymięczne"
        } else if stepVal == "5.0" {
            stepperInfoLabel.text = "roczne"
        } else {
            stepperInfoLabel.text = ""
        }
     
    }

    
    var dateArray = [NSManagedObject]()
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.autorepeat = true
        stepper.wraps = true
        stepper.maximumValue = 5

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func datePickerAction(sender: AnyObject) {
        
       var strDate =  pickDate()
        self.selectedDate.text = strDate
        
    }
    @IBAction func zapiszButtonTapped(sender: AnyObject) {
        
        clearDate()
        
        //var daysToAdd = 2
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        let DateEntity = NSEntityDescription.entityForName("Date", inManagedObjectContext: context)
        var thisDate = NSEntityDescription.insertNewObjectForEntityForName("Date", inManagedObjectContext: self.managedObjectContext) as! Date
        
        var strDate = pickDate()
        var nextDate = addDaysToDate(calcDaysToAdd(stepValue))
        thisDate.dayToAdd = stepValue
        thisDate.date = strDate
        thisDate.changeLensesDate = nextDate
        
        appDel.saveContext()
        
        var request = NSFetchRequest(entityName: "Date")
        var error:NSError? = nil
        var results:NSArray = managedObjectContext.executeFetchRequest(request, error: &error)!
        
        for res in results {
        dateArray.append(thisDate)
            self.selectedDate.text = "zapisano"
            println(res)
        }
        
    }
    
    //helpers
    
    func clearDate(){
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDel.managedObjectContext!
        let request = NSFetchRequest(entityName: "Date")
        var error:NSError?
        let fetchedResults = managedContext.executeFetchRequest(request, error: &error) as! [NSManagedObject]?
        
        if let results = fetchedResults {
            for (var i = 0 ; i < results.count; i++){
                let value = results[i]
                managedContext.deleteObject(value)
                managedContext.save(nil)
            }
        }
    }
    
    func pickDate()-> String{
     
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        var strDate = dateFormatter.stringFromDate(myDatePicker.date)
        
        return strDate
    }
    func addDaysToDate(daysToAdd:Int)-> String{

        var dayComponenet = NSDateComponents()
        dayComponenet.day = daysToAdd
        
        var theCalendar = NSCalendar.currentCalendar()
        var nextDate = theCalendar.dateByAddingComponents(dayComponenet, toDate: myDatePicker.date, options: nil)
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        var finalDate = dateFormatter.stringFromDate(nextDate!)
        
        return finalDate
    }
    
    func getStepValue(stepValue: String)->String{
        return stepValue
    }
    func calcDaysToAdd(stepValue:String)->Int{
        
        
        if  stepValue == "1.0" {
            return 1
        } else if stepValue == "2.0" {
            return 14
        } else if stepValue == "3.0" {
            return 31
        } else if stepValue == "4.0" {
            return 92
        } else if stepValue == "5.0" {
            return 365
        } else {
            return 0
        }
    }

}
