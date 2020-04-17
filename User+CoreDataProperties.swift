//
//  User+CoreDataProperties.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-16.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int16
    @NSManaged public var bday: Date?
    @NSManaged public var firstName: String?
    @NSManaged public var heightCM: Int16
    @NSManaged public var heightFeet: Int16
    @NSManaged public var heightInches: Int16
    @NSManaged public var lastName: String?
    @NSManaged public var password: String?
    @NSManaged public var totalMinsWorked: Int16
    @NSManaged public var totalWeightLifted: Float
    @NSManaged public var userName: String?
    @NSManaged public var weightKG: Int16
    @NSManaged public var weightLBS: Int16

}
