//
//  SharingExerciseCollection.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-18.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import Foundation

class SharingExerciseCollection {
     static let sharedExerciseCollection = SharingExerciseCollection()
     let fileName = "FitnessingExercises.archive"
     private let rootKey = "rootKey"
     var exerciseCollection : ExerciseCollection?
 
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains( FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDirectory = paths[0] as NSString
        return documentsDirectory.appendingPathComponent(fileName) as String
    }
 
    func loadExerciseCollection(){
        print("loadExerciseCollection ...starting")
        let filePath = self.dataFilePath()
        if (FileManager.default.fileExists(atPath: filePath)) {
            let data = NSMutableData(contentsOfFile: filePath)!
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data)
            SharingExerciseCollection.sharedExerciseCollection.exerciseCollection = unarchiver.decodeObject(forKey: rootKey) as? ExerciseCollection
            unarchiver.finishDecoding()
        }
    }
    
    func saveExerciseCollection(){
        let filePath = self.dataFilePath()
        print("Saving the data")
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
    archiver.encode(SharingExerciseCollection.sharedExerciseCollection.exerciseCollection, forKey: rootKey)
        archiver.finishEncoding()
        data.write(toFile: filePath, atomically: true)
    }
    
}
