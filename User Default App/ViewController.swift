//
//  ViewController.swift
//  User Default App
//
//  Created by MSCIT on 20/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inp1: UITextField!
    @IBOutlet weak var inp2: UITextField!
    
    let user = UserDefaults.standard;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = user.object(forKey: "name");
        let surname = user.object(forKey: "surname");
        
        if(name != nil || surname != nil)
        {
            inp1.text =  name as? String;
            inp2.text = surname as? String;
        }
        
    }
    
    @IBAction func saveClick(_ sender: Any) {
        user.set("\(inp1.text!)", forKey: "name")
        user.set("\(inp2.text!)", forKey: "surname")
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        user.removeObject(forKey: "name")
        user.removeObject(forKey: "surname")
        
        inp1.text = ""
        inp2.text = ""
    }
    
}

