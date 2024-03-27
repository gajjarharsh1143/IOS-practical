//
//  Employee+CoreDataProperties.swift
//  CRUD
//
//  Created by Quantum IT on 27/03/24.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var eid: Int32
    @NSManaged public var ename: String?
    @NSManaged public var date: String?
    @NSManaged public var age: Int32
    @NSManaged public var did: Int32
    @NSManaged public var toDept: Department?

}

extension Employee : Identifiable {

}
