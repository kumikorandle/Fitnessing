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
    let collectionKey = "collectionKey"
    
    override init() {
        super.init()
    }
    
    func addExercise(name: String, musclesWorked: [String], videoLink: URL, numReps: Int, numSets: Int, weightLifted: Float) {
        let exercise = Exercise(name: name, musclesWorked: musclesWorked, videoLink: videoLink, numReps: numReps, numSets: numSets, weightLifted: weightLifted)
        collection.append(exercise)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(collection, forKey: collectionKey)
    }
    
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        collection = (decoder.decodeObject(forKey: collectionKey) as? [Exercise])!
    }
    
    
}
