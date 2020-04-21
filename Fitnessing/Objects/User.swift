//
//  User.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-18.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import Foundation
import UIKit
import os.log

class User: NSObject, NSCoding {
    private var firstName: String
    private var lastName: String
    private var heightCM: Float
    private var totalHoursWorked: Float = 0
    private var totalWeightLifted: Float = 0.0
    private var workoutCollection: [Workout]
    private var weightLBS: Float
    private var current: Int = 0
    private var tempExercises: [Exercise] = []
    private var tempExerciseIndex = 0
    //public var userName: String?
    //public var password: String?
    
    init(firstName: String, lastName: String, heightCM: Float, weightLBS: Float, totalHoursWorked: Float, totalWeightLifted: Float, workoutCollection: [Workout]) {
        self.firstName = firstName
        self.lastName = lastName
        self.heightCM = heightCM
        self.weightLBS = weightLBS
        self.totalHoursWorked = totalHoursWorked
        self.totalWeightLifted = totalWeightLifted
        self.workoutCollection = workoutCollection
    }
    
    struct PropertyKey {
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let heightCM = "heightCM"
        static let weightLBS = "weightLBS"
        static let totalHoursWorked = "totalHoursWorked"
        static let totalWeightLifted = "totalWeightLifted"
        static let workoutCollection = "workoutCollection"
        static let current = "current"
    }

    func setFirstName(name: String) {
        self.firstName = name
    }
    
    func setLastName(name: String) {
        self.lastName = name
    }
    
    func setTempExercises(exercises: [Exercise]) {
        self.tempExercises = exercises
    }
    
    func getTempExercises() -> [Exercise] {
        return self.tempExercises
    }
    
    func getTempExercisesIndex() -> Int {
        return self.tempExerciseIndex
    }
    
    func setTempExercisesIndex(index: Int) {
        self.tempExerciseIndex = index
    }
    
    func getCurrentIndex() -> Int {
        return self.current
    }
    
    func setCurrentIndex(index: Int) {
        self.current = index
    }
    
    func getFirstName() -> String {
        return self.firstName
    }
    
    func getLastName() -> String {
        return self.lastName
    }
    
    func getHeight() -> Float {
        return self.heightCM
    }
    
    func getWeight() -> Float {
        return self.weightLBS
    }
    
    func getTotalHoursWorked() -> Float{
        return self.totalHoursWorked
    }
    
    func getTotalWeightLifted() -> Float {
        return self.totalWeightLifted
    }
    
    func getNumWorkoutsCompleted() -> Int{
        var total = 0
        for workout in self.workoutCollection {
            total = total + workout.getTimesCompleted()
        }
        return total
    }
    
    func getWorkoutCollection() -> [Workout] {
        return self.workoutCollection
    }
    
    func addWorkout(workout: Workout) {
        self.workoutCollection.append(workout)
    }
    
    func removeWorkout(workout: Workout) {
        if let index = self.workoutCollection.firstIndex(of: workout) {
            self.workoutCollection.remove(at: index)
        }
    }
    
    func replaceWorkout(index: Int, workout: Workout) {
        self.workoutCollection[index] = workout
    }
    
    func getPreviousWorkout() -> Int {
        var recentDate = Date(timeIntervalSinceReferenceDate: 0)
        var prevWorkout: Int = 0
        
        for workout in self.workoutCollection {
            if workout.getLastDateCompleted() > recentDate {
                recentDate = workout.getLastDateCompleted()
                prevWorkout = self.workoutCollection.firstIndex(of: workout)!
            }
        }
        return prevWorkout
    }
    
    func setTotalHoursWorked(hours: Float) {
        self.totalHoursWorked = hours
    }
    
    func setTotalWeightLifted(weight: Float) {
        self.totalWeightLifted = weight
    }
    
    func setWeight(weight: Float){
        self.weightLBS = weight
    }
    
    func setHeight(height: Float) {
        self.heightCM = height
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(firstName, forKey: PropertyKey.firstName)
        aCoder.encode(lastName, forKey: PropertyKey.lastName)
        aCoder.encode(weightLBS, forKey: PropertyKey.weightLBS)
        aCoder.encode(heightCM, forKey: PropertyKey.heightCM)
        aCoder.encode(totalWeightLifted, forKey: PropertyKey.totalWeightLifted)
        aCoder.encode(totalHoursWorked, forKey: PropertyKey.totalHoursWorked)
        aCoder.encode(workoutCollection, forKey: PropertyKey.workoutCollection)
        aCoder.encode(current, forKey: PropertyKey.current)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail
        guard let firstNameDecoded = aDecoder.decodeObject(forKey: PropertyKey.firstName) as? String else {
            os_log("Unable to decode the name for a user.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let lastNameDecoded = aDecoder.decodeObject(forKey: PropertyKey.lastName) as? String else {
            os_log("Unable to decode the name for a user.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let heightDecoded = aDecoder.decodeFloat(forKey: PropertyKey.heightCM) as Float
        let weightDecoded = aDecoder.decodeFloat(forKey: PropertyKey.weightLBS) as Float
        let totalHoursWorkedDecoded = aDecoder.decodeFloat(forKey: PropertyKey.totalHoursWorked) as Float
        let totalWeightLiftedDecoded = aDecoder.decodeFloat(forKey: PropertyKey.totalWeightLifted) as Float
        let workoutCollectionDecoded = aDecoder.decodeObject(forKey: PropertyKey.workoutCollection) as! [Workout]
        
         // Must call designated initializer.
        self.init(firstName: firstNameDecoded, lastName: lastNameDecoded, heightCM: heightDecoded, weightLBS: weightDecoded, totalHoursWorked: totalHoursWorkedDecoded, totalWeightLifted: totalWeightLiftedDecoded, workoutCollection: workoutCollectionDecoded)
        
        current = aDecoder.decodeInteger(forKey: PropertyKey.current) as Int
    }
}


