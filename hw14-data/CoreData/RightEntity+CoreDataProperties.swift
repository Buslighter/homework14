//
//  RightEntity+CoreDataProperties.swift
//  
//
//  Created by gleba on 07.03.2022.
//
//

import Foundation
import CoreData


extension RightEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RightEntity> {
        return NSFetchRequest<RightEntity>(entityName: "RightEntity")
    }

    @NSManaged public var item: String?

}
