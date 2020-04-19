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
    private var exercises: [Exercise]
    private var timesCompleted: Int = 0
    private var dateCreated: Date
    private var lastDateCompleted: Date?
    private var name: String
    private var current: Int = 0
    
    struct PropertyKey {
        static let name = "name"
        static let exercises = "exercises"
        static let timesCompleted = "timesCompleted"
        static let dateCreated = "dateCreated"
        static let lastDateCompleted = "lastDateCompleted"
        static let current = "current"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(exercises, forKey: PropertyKey.exercises)
        aCoder.encode(timesCompleted, forKey: PropertyKey.timesCompleted)
        aCoder.encode(dateCreated, forKey: PropertyKey.dateCreated)
        aCoder.encode(lastDateCompleted, forKey: PropertyKey.lastDateCompleted)
        aCoder.encode(current, forKey: PropertyKey.current)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail
        guard let nameDecoded = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a workout.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let exercisesDecoded = (aDecoder.decodeObject(forKey: PropertyKey.exercises) as? [Exercise])!
        let timesCompletedDecoded = aDecoder.decodeInteger(forKey: PropertyKey.timesCompleted) as Int
        let dateCreatedDecoded = aDecoder.decodeObject(forKey: PropertyKey.dateCreated) as! Date
        let lastDateCompletedDecoded = aDecoder.decodeObject(forKey: PropertyKey.lastDateCompleted) as? Date
        
        // Must call designated initializer.
        self.init (name: nameDecoded, exercises: exercisesDecoded, dateCreated: dateCreatedDecoded, lastDateCompleted: lastDateCompletedDecoded, timesCompleted: timesCompletedDecoded)
        
        current = aDecoder.decodeInteger(forKey: PropertyKey.current)
    }
        
    init (name: String, exercises: [Exercise], dateCreated: Date, lastDateCompleted: Date?, timesCompleted: Int){
        self.name = name
        self.exercises = exercises
        self.dateCreated = dateCreated
        self.lastDateCompleted = lastDateCompleted
        self.timesCompleted = timesCompleted
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getExercises() -> [Exercise] {
        return self.exercises
    }
    
    func getDateCreated() -> Date {
        return self.dateCreated
    }
    
    func getLastDateCompleted() -> Date {
        return self.lastDateCompleted ?? self.dateCreated
    }
    
    func getTimesCompleted() -> Int {
        return self.timesCompleted
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func addExercise(exercise: Exercise) {
        self.exercises.append(exercise)
    }
    
    func removeExercise(exercise: Exercise) -> Bool {
        if let i = exercises.firstIndex(where: { $0.getName() == exercise.getName() }) {
            self.exercises.remove(at: i)
            return true
        }
        return false
    }
    
    func setTimesCompleted(num: Int) {
        self.timesCompleted = num
    }
    
    func setLastDateCompleted(date: Date) {
        self.lastDateCompleted = date
    }
    
    func getCurrentIndex() -> Int {
        return self.current
    }
    
    func setCurrentIndex(index: Int) {
        self.current = index
    }
}
