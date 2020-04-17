//
//  Workout+CoreDataClass.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-16.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//
//

import Foundation
import CoreData


public class Workout: NSManagedObject {
    convenience init (exercises: [Exercise], timesCompleted: Int16, entity: NSEntityDescription, insertInto context: NSManagedObjectContext!){
        self.init(entity: entity, insertInto: context)
        self.exercises = exercises
        self.timesCompleted = timesCompleted
    }
    
    
}
