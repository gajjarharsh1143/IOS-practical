//
//  ViewController.swift
//  JSON Parsing App
//
//  Created by MSCIT on 15/03/24.
//

//[
//    {
//        "id": 101,
//        "name": "Gajjar Harsh",
//        "Age": 21
//    },
//    {
//        "id": 102,
//        "name": "Ravi Medhat",
//        "Age": 21
//    }
//]






import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let url = Bundle.main.url(forResource: "data", withExtension: "json");
//        print("File Path : \(url!)");
//        
////       let JSONData = url!;
//        
//        let JSONData = try! Data(contentsOf: url!)
//        print("File Size : \(JSONData)");
//        
//        let json = try? JSONSerialization.jsonObject(with: JSONData);
////        print(json as Any);
//        
//        if let dictionary = json as? [String: Any]{
//            let id = dictionary["id"] as? Int{
//                print("Id : \(id)")
//            }
//        }
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        
        let jsonData = url
        
        let data = try? Data(contentsOf: jsonData!)
        let json = try? JSONSerialization.jsonObject(with: data!, options: [])
        
        if let dictionary = json as? [String: Any] {
            
            if let id = dictionary["id"] as? Int {
                print("id is \(id)")
            }
            
            if let name = dictionary["name"] as? String {
                print("Name is \(name)")
            }
            
            if let age = dictionary["marks"] as? Int {
                print("marks is \(age)")
            }
        }
        
    }


}

