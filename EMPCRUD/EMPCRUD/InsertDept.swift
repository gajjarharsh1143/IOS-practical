//
//  InsertDept.swift
//  EMPCRUD
//
//  Created by quantumitservicesllp llp on 21/03/24.
//

import UIKit
import CoreData

class InsertDept: UIViewController {

    @IBOutlet weak var idbox: UITextField!
    @IBOutlet weak var namebox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        print(path[0]);
    }
    
    
    @IBAction func AddDeptEvent(_ sender: Any) {
        let AppD = UIApplication.shared.delegate as! AppDelegate;
        let MOC = AppD.persistentContainer.viewContext;
        
        var dept = Dept(context: MOC);
        dept.id = Int32(idbox.text!)!;
        dept.name = namebox.text!;
        
        do{
            try! MOC.save();
            print("Dept Added");
        }
    }
    
}
