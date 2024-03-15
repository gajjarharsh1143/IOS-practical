//
//  ViewController.swift
//  Gestures App
//
//  Created by MSCIT on 15/03/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        S1.backgroundColor = UIColor.orange;
    }
    
    @IBOutlet var S1: UIView!
    @IBAction func onSwipeRight(sender: Any){
        print("Gesture done of swipe right");
        if S1.backgroundColor == UIColor.orange {
            S1.backgroundColor = UIColor.blue;
        }
        else if S1.backgroundColor == UIColor.blue{
            S1.backgroundColor = UIColor.green;
        }
        else{
            S1.backgroundColor = UIColor.orange;
        }
    }

    @IBAction func onLongPress(sender: Any){
        print("Gesture Long Press");
        if S1.backgroundColor == UIColor.black {
            S1.backgroundColor = UIColor.white;
        }
        else{
            S1.backgroundColor = UIColor.black;
        }
    }

}

