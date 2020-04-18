//
//  Exercise.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-18.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Exercise: NSObject, NSCoding {
    private var name: String
    private var musclesWorked: [String]
    private var numReps: Int = 0
    private var numSets: Int = 0
    private var videoLink: URL?
    private var weightLifted: Float = 0
    private var weight: Float = 0
    
    struct PropertyKey {
        static let name = "name"
        static let musclesWorked = "musclesWorked"
        static let numReps = "numReps"
        static let numSets = "numSets"
        static let videoLink = "videoLink"
        static let weightLifted = "weightLifted"
        static let weight = "weight"
    }
    
    init (name: String, musclesWorked: [String], videoLink: URL, numReps: Int, numSets: Int, weightLifted: Float, weight: Float){
        self.name = name
        self.musclesWorked = musclesWorked
        self.videoLink = videoLink
        self.numReps = numReps
        self.numSets = numSets
        self.weightLifted = weightLifted
        self.weight = weight
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail
        guard let nameDecoded = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for an exercise.", log: OSLog.default, type: .debug)
            return nil
        }
        
        //Because photo is an optional property of Meal, just use conditional cast
        let musclesWorkedDecoded = (aDecoder.decodeObject(forKey: PropertyKey.musclesWorked) as! [String])
        let numRepsDecoded = aDecoder.decodeInteger(forKey: PropertyKey.numReps) as Int
        let numSetsDecoded = aDecoder.decodeInteger(forKey: PropertyKey.numSets) as Int
        let videoLinkDecoded = aDecoder.decodeObject(forKey: PropertyKey.videoLink) as? URL
        let weightLiftedDecoded = aDecoder.decodeFloat(forKey: PropertyKey.weightLifted) as Float
        let weightDecoded = aDecoder.decodeFloat(forKey: PropertyKey.weight) as Float

         // Must call designated initializer.
        self.init(name: nameDecoded, musclesWorked: musclesWorkedDecoded, videoLink: videoLinkDecoded!, numReps: numRepsDecoded, numSets: numSetsDecoded, weightLifted: weightLiftedDecoded, weight: weightDecoded)
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getMusclesWorked() -> [String] {
        return self.musclesWorked
    }
    
    func getNumReps() -> Int {
        return self.numReps
    }
    
    func getNumSets() -> Int {
        return self.numSets
    }
    
    func getVideoLink() -> URL {
        return self.videoLink!
    }
    
    func getWeightLifted() -> Float {
        return self.weightLifted
    }
    
    func setNumReps(reps: Int) {
        self.numReps = reps
    }
    
    func setNumSets(sets: Int) {
        self.numSets = sets
    }
    
    func setWeightLifted(weight: Float) {
        self.weightLifted = weight
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(musclesWorked, forKey: PropertyKey.musclesWorked)
        aCoder.encode(numReps, forKey: PropertyKey.numReps)
        aCoder.encode(numSets, forKey: PropertyKey.numSets)
        aCoder.encode(videoLink, forKey: PropertyKey.videoLink)
        aCoder.encode(weightLifted, forKey: PropertyKey.weightLifted)
        aCoder.encode(weight, forKey: PropertyKey.weight)
    }
    
}
