//
//  ViewController.swift
//  picker
//
//  Created by MSCIT on 23/01/24.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component==0{
            return fruits[0].count
        }
        else{
            return fruits[1].count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component==0{
            return fruits[0][row]
        }
        else{
            return fruits[1][row]
        }
    }
    @IBOutlet weak var textlbl: UILabel!
    
    var fruits:[[String]] = [["A","B","C"],["red","green","blue"]]

    @IBOutlet weak var pickerval: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textlbl.text = "A : 1"
    }
    @IBOutlet var background: UIView!
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        textlbl.text = fruits[0][pickerView.selectedRow(inComponent: 0)] + " : " +  fruits[1][pickerView.selectedRow(inComponent: 1)]
        if(fruits[1][pickerView.selectedRow(inComponent: 1)] == "red"){
//            textlbl.textColor = UIColor.red
            background.backgroundColor = UIColor.red
        }
        else if(fruits[1][pickerView.selectedRow(inComponent: 1)] == "green"){
//            textlbl.textColor = UIColor.green
            background.backgroundColor = UIColor.green
        }
        else if(fruits[1][pickerView.selectedRow(inComponent: 1)] == "blue"){
//            textlbl.textColor = UIColor.blue
            background.backgroundColor = UIColor.blue
        }
    }
}

