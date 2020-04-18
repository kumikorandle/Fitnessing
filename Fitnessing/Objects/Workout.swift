//
//  Workout.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-18.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Workout: NSObject, NSCoding {
    public var exercises: [Exercise]
    public var timesCompleted: Int = 0
    public var dateCreated: Date
    public var lastDateCompleted: Date?
    public var name: String
    
    struct PropertyKey {
        static let name = "name"
        static let exercises = "exercises"
        static let timesCompleted = "timesCompleted"
        static let dateCreated = "dateCreated"
        static let lastDateCompleted = "lastDateCompleted"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(exercises, forKey: PropertyKey.exercises)
        aCoder.encode(timesCompleted, forKey: PropertyKey.timesCompleted)
        aCoder.encode(dateCreated, forKey: PropertyKey.dateCreated)
        aCoder.encode(lastDateCompleted, forKey: PropertyKey.lastDateCompleted)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail
        guard let nameDecoded = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a workout.", log: OSLog.default, type: .debug)
            return nil
        }
        
        //Because photo is an optional property of Meal, just use conditional cast
        let exercisesDecoded = (aDecoder.decodeObject(forKey: PropertyKey.exercises) as? [Exercise])!
        let timesCompletedDecoded = aDecoder.decodeInteger(forKey: PropertyKey.timesCompleted) as Int
        let dateCreatedDecoded = aDecoder.decodeObject(forKey: PropertyKey.dateCreated) as! Date
        let lastDateCompletedDecoded = aDecoder.decodeObject(forKey: PropertyKey.lastDateCompleted) as! Date
        
        // Must call designated initializer.
        self.init (name: nameDecoded, exercises: exercisesDecoded, dateCreated: dateCreatedDecoded, lastDateCompleted: lastDateCompletedDecoded, timesCompleted: timesCompletedDecoded)
    }
    
    init (name: String, exercises: [Exercise], dateCreated: Date, lastDateCompleted: Date?, timesCompleted: Int){
        self.name = name
        self.exercises = exercises
        self.dateCreated = dateCreated
        self.lastDateCompleted = lastDateCompleted
        self.timesCompleted = timesCompleted
    }
}
