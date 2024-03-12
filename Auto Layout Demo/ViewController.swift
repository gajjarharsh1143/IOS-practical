//
//  ViewController.swift
//  Auto Layout Demo
//
//  Created by MSCIT on 12/03/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonTapped(_sender:UIButton){
        if _sender.title(for: .normal) == "X"{
            _sender.setTitle("To Long Title", for: .normal);
        }
        else{
            _sender.setTitle("X", for: .normal)
        }
    }
    
}

