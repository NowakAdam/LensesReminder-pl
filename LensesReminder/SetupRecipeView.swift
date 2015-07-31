//
//  SetupRecipeView.swift
//  LensesReminder
//
//  Created by Adam Nowak on 10.07.2015.
//  Copyright (c) 2015 Nowak Adam. All rights reserved.
//

import UIKit
import CoreData

class SetupRecipeView: UIViewController {
    
    
    @IBOutlet weak var setupRecipeScrollView: UIScrollView!
    @IBOutlet weak var dalOPSferaTextField: UITextField!
    @IBOutlet weak var dalOPcylinderTextField: UITextField!
    @IBOutlet weak var dalOPOsTextField: UITextField!
    @IBOutlet weak var dalOPPryzmaTextField: UITextField!
    @IBOutlet weak var dalOLSferaTextField: UITextField!
    @IBOutlet weak var dalOLCylinderTextField: UITextField!
    @IBOutlet weak var dalOLOsTextField: UITextField!
    @IBOutlet weak var dalOLPryzmaTextField: UITextField!
    @IBOutlet weak var blizOPSferaTextField: UITextField!
    @IBOutlet weak var blizOPCylinderTextField: UITextField!
    @IBOutlet weak var blizOPOsTextField: UITextField!
    @IBOutlet weak var blizOPPryzmaTextField: UITextField!
    @IBOutlet weak var blizOLSferaTextField: UITextField!
    @IBOutlet weak var blizOLCylinderTextField: UITextField!
    @IBOutlet weak var blizOLOsTextField: UITextField!
    @IBOutlet weak var blizOLPryzmaTextField: UITextField!
    @IBOutlet weak var zapisanoLabel: UILabel!
    
    let functions = FunctionsCoreData()
    var lensesarray = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupRecipeScrollView.contentSize.height = 600
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func zapiszButtonTapped(sender: UIButton) {
        
        dalOPSferaTextField.resignFirstResponder()
        dalOPcylinderTextField.resignFirstResponder()
        dalOPOsTextField.resignFirstResponder()
        dalOPPryzmaTextField.resignFirstResponder()
        dalOLSferaTextField.resignFirstResponder()
        dalOLCylinderTextField.resignFirstResponder()
        dalOLOsTextField.resignFirstResponder()
        dalOLPryzmaTextField.resignFirstResponder()
        blizOPSferaTextField.resignFirstResponder()
        blizOPCylinderTextField.resignFirstResponder()
        blizOPOsTextField.resignFirstResponder()
        blizOPPryzmaTextField.resignFirstResponder()
        blizOLSferaTextField.resignFirstResponder()
        blizOLCylinderTextField.resignFirstResponder()
        blizOLOsTextField.resignFirstResponder()
        blizOLPryzmaTextField.resignFirstResponder()
        
        functions.appDel()
        var context:AnyObject = functions.managedObjectContext()
        var thisLense = functions.prepareEntity("Lenses") as! Lenses
        
            thisLense.dal_right_sfera = dalOPSferaTextField.text
            thisLense.dal_right_cylinder = dalOPcylinderTextField.text
            thisLense.dal_right_os = dalOPOsTextField.text
            thisLense.dal_right_pryzma = dalOPPryzmaTextField.text
            thisLense.dal_left_sfera = dalOLSferaTextField.text
            thisLense.dal_left_cylinder = dalOLCylinderTextField.text
            thisLense.dal_left_os = dalOLOsTextField.text
            thisLense.dal_left_pryzma = dalOLPryzmaTextField.text
            thisLense.bliz_left_sfera = blizOLSferaTextField.text
            thisLense.bliz_left_cylinder = blizOLCylinderTextField.text
            thisLense.bliz_left_os = blizOLOsTextField.text
            thisLense.bliz_left_pryzma = blizOLPryzmaTextField.text
            thisLense.bliz_right_sfera = blizOPSferaTextField.text
            thisLense.bliz_right_cylinder = blizOPCylinderTextField.text
            thisLense.bliz_right_os = blizOPOsTextField.text
            thisLense.bliz_right_pryzma = blizOPPryzmaTextField.text
        
        functions.SaveContextFunction()
        let results: NSArray = functions.executeRequest("Lenses")
        
        for res in results {
            lensesarray.append(thisLense)
            zapisanoLabel.text = "Zapisano!"
        }
    }
}
