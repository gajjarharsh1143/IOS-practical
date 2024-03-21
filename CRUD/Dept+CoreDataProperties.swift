//
//  Dept+CoreDataProperties.swift
//  CRUD
//
//  Created by quantumitservicesllp llp on 21/03/24.
//
//

import Foundation
import CoreData


extension Dept {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dept> {
        return NSFetchRequest<Dept>(entityName: "Dept")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var toEmp: NSSet?

}

// MARK: Generated accessors for toEmp
extension Dept {

    @objc(addToEmpObject:)
    @NSManaged public func addToToEmp(_ value: Emp)

    @objc(removeToEmpObject:)
    @NSManaged public func removeFromToEmp(_ value: Emp)

    @objc(addToEmp:)
    @NSManaged public func addToToEmp(_ values: NSSet)

    @objc(removeToEmp:)
    @NSManaged public func removeFromToEmp(_ values: NSSet)

}

extension Dept : Identifiable {

}
