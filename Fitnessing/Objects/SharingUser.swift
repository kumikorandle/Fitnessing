//
//  SharingUser.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-18.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import Foundation

class SharingUser {
     static let sharedUser = SharingUser()
     let fileName = "FitnessingUser.archive"
     private let rootKey = "rootKey"
     var user : User?
 
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains( FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDirectory = paths[0] as NSString
        return documentsDirectory.appendingPathComponent(fileName) as String
    }
 
    func loadUser(){
        print("loadUser ...starting")
        let filePath = self.dataFilePath()
        if (FileManager.default.fileExists(atPath: filePath)) {
            let data = NSMutableData(contentsOfFile: filePath)!
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data)
            SharingUser.sharedUser.user = unarchiver.decodeObject(forKey: rootKey) as? User
            unarchiver.finishDecoding()
        }
    }
    
    func saveUser(){
        let filePath = self.dataFilePath()
        print("Saving the data")
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
    archiver.encode(SharingUser.sharedUser.user, forKey: rootKey)
        archiver.finishEncoding()
        data.write(toFile: filePath, atomically: true)
    }
}
