//
//  ViewController.swift
//  SQLite_project
//
//  Created by MSCIT on 30/01/24.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    
    @IBOutlet weak var Label1: UILabel!
    
    @IBOutlet weak var LableData: UILabel!
    
    @IBOutlet weak var datePicaker: UIDatePicker!
    var db_path : String = "myDB.sqlite"
    var db_pointer : OpaquePointer?
    
    func displayData() {
        let GetData = "SELECT * FROM student_table"
        
        var select_stmt:OpaquePointer?=nil;
        
        if( sqlite3_prepare_v2(db_pointer, GetData , -1, &select_stmt , nil) == SQLITE_OK ){
                
                while ( sqlite3_step(select_stmt) == SQLITE_ROW )
                {
                    let roll = sqlite3_column_int(select_stmt, 0)
                    let name = String ( describing: String( cString:  sqlite3_column_text(select_stmt, 1) ))
                    
                    let age = sqlite3_column_int(select_stmt, 2)
                    let birthdate = String ( describing: String( cString:  sqlite3_column_text(select_stmt, 3) ))
                    
//                    print(name)
                    print("roll \(roll)  name \(name)  birthdate \(birthdate)  age \(age)")
                    
                    LableData.text = LableData.text! + "\n  \(roll) |  \(name) | \(birthdate) | \(age)"
                
                }
                
        }else{
            print("Error in Prepare statement ")
        }
        sqlite3_finalize(select_stmt)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        Label1.text = ""
        LableData.text = ""

        // Do any additional setup after loading the view.
        let file_path = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appending(path: db_path)
        
        if(sqlite3_open(file_path.path , &db_pointer) != SQLITE_OK){
            print("Error in Database Creation ")
            Label1.text = Label1.text! + "Error in Database Creation "
        }else{
            print("Database Created .... ")
            Label1.text = Label1.text! + "Database Created ...."
        }
        
        let CreateTable = "CREATE TABLE IF NOT EXISTS student_table(rollNo INTEGER PRIMERY KEY, name TEXT, age INTEGER, birthDate TEXT)"
        
        var create_stmt:OpaquePointer?=nil;
        
        if( sqlite3_prepare_v2(db_pointer, CreateTable , -1, &create_stmt , nil) == SQLITE_OK ){
            
            if( sqlite3_step(create_stmt) == SQLITE_DONE ){
                print("Table Created .... ")
                Label1.text = Label1.text! + "Table Created .... "
            }else{
                print("Error in Table Creation ")
                Label1.text = Label1.text! + "Error in Table Creation"
            }
            
        }else{
            print("Error in Prepare statement ")
            Label1.text = Label1.text! + "Error in Prepare statement "
        }
        sqlite3_finalize(create_stmt)
        
//        let InsertData = "delete from student_table where rollNo = 26"

        
        let InsertData = "Insert into student_table values (26,'\(Date.now.formatted(date: .numeric, time: .shortened))',25,'26-01-2003')"
        
        var insert_stmt:OpaquePointer?=nil;
        
        if( sqlite3_prepare_v2(db_pointer, InsertData , -1, &insert_stmt , nil) == SQLITE_OK ){
            
            if( sqlite3_step(insert_stmt) == SQLITE_DONE ){
                print("Data inserted .... ")
                Label1.text = Label1.text! + "Data inserted ...."

            }else{
                print("Error in Data inserting ")
            }
            
        }else{
            print("Error in Prepare statement ")
        }
        sqlite3_finalize(insert_stmt)
        
                
        displayData()
        
        let dirpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
        
        print("dirpath : \(dirpath[0]) ")
        
    }

    @IBAction func updatebtnclick(_ sender: Any) {
        let InsertData = "update student_table set name = '\(Date.now.formatted(date: .numeric, time: .standard))' where  name = '\(datePicaker.date.formatted(date: .numeric, time: .standard))' "
        
        var insert_stmt:OpaquePointer?=nil;
        
        if( sqlite3_prepare_v2(db_pointer, InsertData , -1, &insert_stmt , nil) == SQLITE_OK ){
            
            if( sqlite3_step(insert_stmt) == SQLITE_DONE ){
                print("Data inserted .... ")
                Label1.text = Label1.text! + "Data inserted ...."

            }else{
                print("Error in Data inserting ")
            }
            
        }else{
            print("Error in Prepare statement ")
        }
        sqlite3_finalize(insert_stmt)
        
        displayData()
    }
    
   
}

