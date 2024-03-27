//
//  Department+CoreDataProperties.swift
//  CRUD
//
//  Created by Quantum IT on 27/03/24.
//
//

import Foundation
import CoreData


extension Department {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Department> {
        return NSFetchRequest<Department>(entityName: "Department")
    }

    @NSManaged public var did: Int32
    @NSManaged public var dname: String?
    @NSManaged public var toEmp: NSSet?

}

// MARK: Generated accessors for toEmp
extension Department {

    @objc(addToEmpObject:)
    @NSManaged public func addToToEmp(_ value: Employee)

    @objc(removeToEmpObject:)
    @NSManaged public func removeFromToEmp(_ value: Employee)

    @objc(addToEmp:)
    @NSManaged public func addToToEmp(_ values: NSSet)

    @objc(removeToEmp:)
    @NSManaged public func removeFromToEmp(_ values: NSSet)

}

extension Department : Identifiable {

}
