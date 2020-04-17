//
//  Exercise+CoreDataProperties.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-16.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var musclesWorked: [String]
    @NSManaged public var name: String?
    @NSManaged public var numReps: Int16
    @NSManaged public var numSets: Int16
    @NSManaged public var pictures: [UIImage]?
    @NSManaged public var videoLink: URL?
    @NSManaged public var weightLifted: Float

}
