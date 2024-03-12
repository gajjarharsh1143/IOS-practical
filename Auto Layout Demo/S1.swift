//
//  S1.swift
//  Auto Layout Demo
//
//  Created by MSCIT on 12/03/24.
//

import UIKit

class S1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func Btnclicked(sender:UIButton){
        if sender.title(for: .normal) == "X"{
            sender.setTitle("To Long Text", for: .normal)
        }
        else{
            sender.setTitle("X", for: .normal)
        }
    }
}
