//
//  Student+CoreDataProperties.swift
//  Core Data Demo
//
//  Created by MSCIT on 07/02/24.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var age: Int32
    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var sid: Int32

}

extension Student : Identifiable {

}
