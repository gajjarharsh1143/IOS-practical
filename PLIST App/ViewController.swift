//
//  ViewController.swift
//  PLIST App
//
//  Created by MSCIT on 18/03/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var datavalues = [String]();
        
        let path = Bundle.main.url(forResource: "fruits", withExtension: "plist");
        
        let dict = NSDictionary(contentsOf: path!);
        
        datavalues = dict?.allValues as! [String];
        
        print(datavalues);
        
    }


}

