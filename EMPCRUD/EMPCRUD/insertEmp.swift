//
//  insertEmp.swift
//  EMPCRUD
//
//  Created by quantumitservicesllp llp on 21/03/24.
//

import UIKit
import CoreData

class insertEmp: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DeptList.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DeptList[row].name;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDept = DeptList[row];
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DisplayDept();
    }
    
    var DeptList:[Dept] = [];
    var selectedDept:Dept?;
    
    func DisplayDept(){
        let AppD = UIApplication.shared.delegate as! AppDelegate;
        let MOC = AppD.persistentContainer.viewContext;
        
        let FR = NSFetchRequest<Dept>(entityName: "Dept");
        
        do{
            DeptList = try! MOC.fetch(FR);
        }
        
    }
    
    @IBOutlet weak var IDBox: UITextField!
    
    @IBOutlet weak var NameBox: UITextField!
    
    @IBOutlet weak var DesigBox: UITextField!
    
    
    @IBAction func EmpInsertEvent(_ sender: Any) {
        let AppD = UIApplication.shared.delegate as! AppDelegate;
        let MOC = AppD.persistentContainer.viewContext;
        
        var Emp = Emp(context: MOC);
        
        Emp.id = Int32(IDBox.text!)!;
        Emp.name = NameBox.text
        Emp.designation = DesigBox.text
        Emp.did = Int32(selectedDept!.id)
        
        selectedDept?.addToToEmp(Emp);
        
        do{
            try! MOC.save();
            print("Employee Added");
        }
    }
    
}
