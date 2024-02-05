//
//  ViewController.swift
//  Core Data Demo
//
//  Created by MSCIT on 05/02/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addbtnclick(_ sender: Any) {
        let appData = UIApplication.shared.delegate as? AppDelegate
        
        let moc = (appData?.persistentContainer.viewContext)!;
        
        let sampleObj = NSEntityDescription.insertNewObject(forEntityName: "Student", into: moc);
        
        sampleObj.setValue(1, forKey: "sid");
        sampleObj.setValue("Harsh", forKey: "name");
        sampleObj.setValue("MAle", forKey: "gender");
        sampleObj.setValue(21, forKey: "age");
        
        try! moc.save()
        print("Record Inserted");
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
        print("dirname : \(dirPath)")
    }
    
    @IBAction func showDatabtn(_ sender: Any) {
        let appData = UIApplication.shared.delegate as? AppDelegate
        
        let moc = (appData?.persistentContainer.viewContext)!;
        
        let result = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        
        do {
            let result = try moc.fetch(result)
            for data in result as! [NSObject] {
                let sid = data.value(forKey: "sid") as! Int
                let name = data.value(forKey: "name") as! String
                let gender = data.value(forKey: "gender") as! String
                let age = data.value(forKey: "age") as! Int

                print("Student ID: \(sid), Name: \(name), Gender: \(gender), Age: \(age)")
            }
        } catch {
            print("Failed to fetch data: \(error)")
        }
    }
}

