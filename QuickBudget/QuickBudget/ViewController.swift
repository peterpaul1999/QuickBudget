//
//  ViewController.swift
//  QuickBudget
//
//  Created by Thomas Karg on 19.11.16.
//  Copyright © 2016 Thomas Karg. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        DatabaseModelController.addCategory(name: "TestCatagory")
//        
//        let catagories = DatabaseModelController.getGategories()
//        print("number of results: \(catagories.count)")
//        for category in catagories {
//            print("\(category.name!)")
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DeleteAll(_ sender: Any) {
        DatabaseModelController.clearCoreData()
    }
    
}

