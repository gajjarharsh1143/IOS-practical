//
//  Emp+CoreDataProperties.swift
//  CRUD
//
//  Created by quantumitservicesllp llp on 21/03/24.
//
//

import Foundation
import CoreData


extension Emp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Emp> {
        return NSFetchRequest<Emp>(entityName: "Emp")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var designation: String?
    @NSManaged public var toDept: Dept?

}

extension Emp : Identifiable {

}
