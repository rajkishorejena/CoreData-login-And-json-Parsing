//
//  Employee+CoreDataProperties.swift
//  FirstAsignment
//
//  Created by Jovial on 2/29/20.
//  Copyright © 2020 Rajkishore. All rights reserved.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var phone: String?

}
