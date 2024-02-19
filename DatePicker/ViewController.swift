//
//  ViewController.swift
//  DatePicker
//
//  Created by MSCIT on 29/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var datepicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ondatepickerchanged(_ sender: Any) {
        let df = DateFormatter()
        df.dateStyle = DateFormatter.Style.long
        df.dateFormat = "dd/MM/yyyy hh:mm DD "
        lbl.text = df.string(from: datepicker.date)
    }
    
}

