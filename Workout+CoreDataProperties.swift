//
//  Workout+CoreDataProperties.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-16.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//
//

import Foundation
import CoreData


extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var exercises: NSObject?
    @NSManaged public var timesCompleted: Int16
    @NSManaged public var lastDateCompleted: Date?

}
