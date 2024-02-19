//
//  ViewController.swift
//  Core Data Demo
//
//  Created by MSCIT on 05/02/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textBox_id: UITextField!
    @IBOutlet weak var textBox_name: UITextField!
    @IBOutlet weak var textBox_gender: UITextField!
    @IBOutlet weak var textBox_age: UITextField!
    @IBOutlet weak var Label_data: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addbtnclick(_ sender: Any) {
        let appData = UIApplication.shared.delegate as? AppDelegate
        
        let moc = (appData?.persistentContainer.viewContext)!;
        
        let sampleObj = NSEntityDescription.insertNewObject(forEntityName: "Student", into: moc);
        
        sampleObj.setValue(Int(textBox_id.text!), forKey: "sid");
        sampleObj.setValue(textBox_name.text, forKey: "name");
        sampleObj.setValue(textBox_gender.text, forKey: "gender");
        sampleObj.setValue(Int(textBox_age.text!), forKey: "age");
        
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
            Label_data.text =  " "
            
            for data in result as! [NSObject] {
                let sid = data.value(forKey: "sid") as! Int
                let name = data.value(forKey: "name") as! String
                let gender = data.value(forKey: "gender") as! String
                let age = data.value(forKey: "age") as! Int

                print("Student ID: \(sid), Name: \(name), Gender: \(gender), Age: \(age)")
                Label_data.text = Label_data.text! + "\n Student ID: \(sid), Name: \(name), Gender: \(gender), Age: \(age)"
            }
        } catch {
            print("Failed to fetch data: \(error)")
        }
        
//        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Student");
//        let fr = NSFetchRequest<Student>(entityName: "Student");
//        
//        do{
//            let record = try moc.fetch(fr);
//            
//            for data in record as! [Student] {
//                let sid = data.value(forKey: "sid") as! Int
//                    let name = data.value(forKey: "name") as! String
//                    let gender = data.value(forKey: "gender") as! String
//                    let age = data.value(forKey: "age") as! Int
//                
//                    print("Student ID: \(sid), Name: \(name), Gender: \(gender), Age: \(age)")
//                    Label_data.text = Label_data.text! + "\n Student ID: \(sid), Name: \(name), Gender: \(gender), Age: \(age)"
//            }
//        }
    }
    
    @IBAction func UpdateBtn(_ sender: Any) {

        let appData = UIApplication.shared.delegate as? AppDelegate
        
        let moc = (appData?.persistentContainer.viewContext)!;
        
        let result = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        let id =  Int(textBox_id.text!)
    
        result.predicate = NSPredicate( format: "sid == %@", NSNumber(value: id!))
        
        do {
            let results = try! moc.fetch(result)
            let obj = results[0] as! NSObject
            obj.setValue(textBox_name.text, forKey: "name")
            try! moc.save()
            print("Updated")
            
        }
    }
    
    @IBAction func DeleteBtn(_ sender: Any) {
        
        let appData = UIApplication.shared.delegate as? AppDelegate
        
        let moc = (appData?.persistentContainer.viewContext)!;
        
        let result = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        let id =  Int(textBox_id.text!)
    
        result.predicate = NSPredicate( format: "sid == %@", NSNumber(value: id!))
        
        do {
            let results = try! moc.fetch(result)
            let obj = results[0] as! NSManagedObject
            
            moc.delete(obj)
            
            try! moc.save()
            print("Updated")
        }
    }
    
    
    @IBAction func NEWBTNEVENT(_ sender: Any) {
        let appData = UIApplication.shared.delegate as? AppDelegate
        
        let moc = (appData?.persistentContainer.viewContext)!;
        
        let obj = Student(context: moc);
        obj.sid = 1561;
        obj.name = "new record object";
        obj.gender = "Male";
        obj.age = 200;
        
        do{
            try! moc.save()
            print("Record Inserted");
        }
    }
}

