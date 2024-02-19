//
//  ViewController.swift
//  TableViewApp
//
//  Created by MSCIT on 12/02/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var tableData:[String] = ["a","b","c","d","e"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: IndexPath)
//        
//        cell.textLabel?.text = tableData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tableData[indexPath.row]
        
        
        return cell
    }
    
    var rowindex:Int?
    @IBOutlet weak var inputfield: UITextField!
    @IBOutlet weak var tbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbl.dataSource = self
        tbl.delegate = self
                
                // Register cell class if necessary
        tbl.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @IBAction func addclick(_ sender: Any){
        tableData.append(inputfield.text!)
        tbl.beginUpdates()
        tbl.insertRows(at: [IndexPath(row: tableData.count - 1, section: 0)], with: .automatic)
        tbl.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        inputfield.text = tableData[indexPath.row]
        rowindex = indexPath.row
    }
    
    @IBAction func deleteBtnclick(_ sender: Any) {
        tableData.remove(at: rowindex!)
        tbl.beginUpdates()
        tbl.deleteRows(at: [IndexPath(row: rowindex!, section: 0)], with: .automatic)
        tbl.endUpdates()
    }
}

