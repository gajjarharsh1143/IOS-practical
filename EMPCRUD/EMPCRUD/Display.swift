//
//  Display.swift
//  EMPCRUD
//
//  Created by quantumitservicesllp llp on 21/03/24.
//

import UIKit
import CoreData

class Display: UITableViewController {
    
    var DeptList:[Dept] = [];
    
    func DisplayDept(){
        let AppD = UIApplication.shared.delegate as! AppDelegate;
        let MOC = AppD.persistentContainer.viewContext;
        
        let FR = NSFetchRequest<Dept>(entityName: "Dept");
        
        do{
            DeptList = try! MOC.fetch(FR);
        }
        
    }
    
    @IBAction func swipLeft(){
        print("AASDF")
        DisplayDept();
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DisplayDept();

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DeptList.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celldata", for: indexPath)

        cell.textLabel?.text = "Dept-Name : \(DeptList[indexPath.row].name!)";

        return cell;
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let AppD = UIApplication.shared.delegate as! AppDelegate;
            let MOC = AppD.persistentContainer.viewContext;
            
            MOC.delete(DeptList[indexPath.row]);
            
            DeptList.remove(at: indexPath.row);
            
            do{
                try! MOC.save()
            }
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
