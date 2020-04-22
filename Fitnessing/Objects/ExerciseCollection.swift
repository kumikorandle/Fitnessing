//
//  ExerciseCollection.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-18.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import Foundation
import UIKit

class ExerciseCollection: NSObject, NSCoding {
    var collection = [Exercise]()
    var current = 0
    let collectionKey = "collectionKey"
    let currentKey = "currentKey"
    
    override init() {
        super.init()
        // Lower body workouts
        addExercise(name: "Sumo Squat", musclesWorked: ["Quadriceps", "Glutes", "Hamstrings", "Lower Back"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Pulse Squat", musclesWorked: ["Quadriceps", "Glutes", "Hamstrings", "Lower Back"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Bulgarian Split Squat", musclesWorked: ["Quadriceps", "Glutes", "Hamstrings", "Lower Back"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Leg Press", musclesWorked: ["Quadriceps", "Glutes", "Hamstrings", "Calves"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Reverse Lunge", musclesWorked: ["Quadriceps", "Glutes", "Hamstrings", "Calves"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Lunge", musclesWorked: ["Quadriceps", "Glutes", "Hamstrings", "Calves"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
         addExercise(name: "Lateral Lunge", musclesWorked: ["Quadriceps", "Glutes"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Sumo Deadlift", musclesWorked: ["Quadriceps", "Glutes", "Hamstrings", "Lower Back"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "RDL", musclesWorked: ["Adductor", "Glutes", "Hamstrings"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Good Morning", musclesWorked: ["Glutes", "Hamstrings", "Lower Back"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Hip Abduction", musclesWorked: ["Glutes", "Abductors"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Cable Pull Through", musclesWorked: ["Hamstrings", "Glutes", "Lower Back"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Single Leg RDL", musclesWorked: ["Glutes", "Hamstrings", "Adductors"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Leg Extension", musclesWorked: ["Quadriceps"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Lying Leg Curl", musclesWorked: ["Glutes", "Hamstrings", "Calves"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Hip Thrusts", musclesWorked: ["Glutes", "Hamstrings"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Elevated Hip Thrusts", musclesWorked: ["Glutes", "Hamstrings"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "SL Elevated Hip Thrusts", musclesWorked: ["Glutes", "Hamstrings"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Glute Bridge + Abduction", musclesWorked: ["Glutes", "Hamstrings"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Curtsy Lunge", musclesWorked: ["Glutes", "Quadriceps"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Banded Side Steps", musclesWorked: ["Quadriceps", "Glutes"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Banded Wall Sit Pulses", musclesWorked: ["Quadriceps", "Glutes", "Calves"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        
        // Upper body workouts
        addExercise(name: "Bench Press", musclesWorked: ["Pectorals", "Deltoids", "Triceps"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Chest Fly", musclesWorked: ["Pectorals", "Deltoids"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Bicep Curl", musclesWorked: ["Biceps", "Forearms"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Tricep Extension", musclesWorked: ["Triceps", "Forearms"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        addExercise(name: "Pushup", musclesWorked: ["Triceps", "Pectorals", "Deltoids"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        
        // Abs
        addExercise(name: "Sled Crunches", musclesWorked: ["Abs"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
         addExercise(name: "Leg Lifts", musclesWorked: ["Abs"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
         addExercise(name: "Heel Touches", musclesWorked: ["Abs"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
         addExercise(name: "Russian Twists", musclesWorked: ["Abs"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
         addExercise(name: "Single Leg Bicycle Crunches", musclesWorked: ["Abs"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
         addExercise(name: "Cross Body Toe Touches", musclesWorked: ["Abs"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
         addExercise(name: "Single Leg V Up", musclesWorked: ["Abs"], videoLink: URL(fileURLWithPath: ""), numReps: 0, numSets: 0, weightLifted: 0, weight: 0)
        
        collection = collection.sorted { $0.getName() < $1.getName() }
    }
    
    func addExercise(name: String, musclesWorked: [String], videoLink: URL, numReps: Int, numSets: Int, weightLifted: Float, weight: Float) {
        let exercise = Exercise(name: name, musclesWorked: musclesWorked, videoLink: videoLink, numReps: numReps, numSets: numSets, weightLifted: weightLifted, weight: weight)
        collection.append(exercise)
    }
    
    func getExercise(name: String) -> Exercise? {
        if let i = collection.firstIndex(where: { $0.getName() == name }) {
            return collection[i]
        }
        return nil
    }
    
    func getCurrentIndex() -> Int {
        return self.current
    }
    
    func setCurrentIndex(index: Int) {
        self.current = index
    }
    
    func getCollection() -> [Exercise] {
        return collection
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(collection, forKey: collectionKey)
        coder.encode(current, forKey: currentKey)

    }
    
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        collection = (decoder.decodeObject(forKey: collectionKey) as? [Exercise])!
        current = decoder.decodeInteger(forKey: currentKey)
    }
    
    
}
