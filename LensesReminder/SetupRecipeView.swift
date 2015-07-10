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
    //textFields
    
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
//AppDelegate
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        let lensesEntity = NSEntityDescription.entityForName("Lenses", inManagedObjectContext:context)
    //Dal=============================================================================================
        var newLeftDLense = Lenses(entity:lensesEntity!, insertIntoManagedObjectContext:context)
        var newRightDLense = Lenses(entity: lensesEntity!, insertIntoManagedObjectContext:context)
        newRightDLense.dal_sfera = dalOPSferaTextField.text
        newRightDLense.dal_cylinder = dalOPcylinderTextField.text
        newRightDLense.dal_os = dalOPOsTextField.text
        newRightDLense.dal_pryzma = dalOPPryzmaTextField.text
        newLeftDLense.dal_sfera = dalOLSferaTextField.text
        newLeftDLense.dal_cylinder = dalOLCylinderTextField.text
        newLeftDLense.dal_os = dalOLOsTextField.text
        newLeftDLense.dal_pryzma = dalOLPryzmaTextField.text
    //Bliż=============================================================================================
        var newLeftBLense = Lenses(entity: lensesEntity!, insertIntoManagedObjectContext: context)
        var newRightBLense = Lenses(entity: lensesEntity!, insertIntoManagedObjectContext: context)
        newLeftBLense.bliz_sfera = blizOLSferaTextField.text
        newLeftBLense.bliz_cylinder = blizOLCylinderTextField.text
        newLeftBLense.bliz_os = blizOLOsTextField.text
        newLeftBLense.bliz_pryzma = blizOLPryzmaTextField.text
        newRightBLense.bliz_sfera = blizOPSferaTextField.text
        newRightBLense.bliz_cylinder = blizOPCylinderTextField.text
        newRightBLense.bliz_os = blizOPOsTextField.text
        newRightBLense.bliz_pryzma = blizOPPryzmaTextField.text
        
    }
 


}
