//
//  Exercise+CoreDataClass.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-16.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

public class Exercise: NSManagedObject {

    convenience init (name: String, musclesWorked: [String], videoLink: URL, pictures: [UIImage], entity: NSEntityDescription, insertInto context: NSManagedObjectContext!){
        self.init(entity: entity, insertInto: context)
        self.name = name
        self.musclesWorked = musclesWorked
        self.videoLink = videoLink
        self.pictures = pictures
    }
}
