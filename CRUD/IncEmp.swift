//
//  IncEmp.swift
//  CRUD
//
//  Created by Quantum IT on 27/03/24.
//

import UIKit
import CoreData

class IncEmp: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITabBarControllerDelegate {
    var DeptList:[Department] = [];
    
    var selectedDept:Department?;
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DeptList.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DeptList[row].dname;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDept = DeptList[row];
    }
    
    @IBOutlet weak var pickerViewobj: UIPickerView!
    
    func DisplayDept(){
        let AppD = UIApplication.shared.delegate as! AppDelegate;
        let MOC = AppD.persistentContainer.viewContext;
        
        let FR = NSFetchRequest<Department>(entityName: "Department");
        
        do{
            DeptList = try! MOC.fetch(FR);
            pickerViewobj.reloadComponent(0);
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        
        tabBarController?.delegate = self
        
        DisplayDept();
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print(viewController is IncEmp)
        if viewController is IncEmp{
            print("ABC")
            DisplayDept();
        }
    }
}
