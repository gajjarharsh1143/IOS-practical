//
//  id.swift
//  CRUD
//
//  Created by Quantum IT on 27/03/24.
//

import UIKit

class id: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
        print(path[0]);
    
    @IBOutlet weak var idbox: UITextField!
    @IBOutlet weak var namebox: UITextField!
    
    @IBAction func incDeptevent(_ sender: Any) {
        let AppD = UIApplication.shared.delegate as! AppDelegate;
        let MOC = AppD.persistentContainer.viewContext;
        
        var d = Department(context: MOC);
        d.did = Int32(idbox.text!)!;
        d.dname = namebox.text!;
        
        do{
            try! MOC.save();
            print("Data Inserted");
            idbox.text = "";
            namebox.text = "";
        }
    }
}
