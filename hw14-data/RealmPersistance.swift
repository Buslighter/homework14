//
//  RealmPersistance.swift
//  hw14-data
//
//  Created by gleba on 28.02.2022.
//

import Foundation
import RealmSwift
//class RealmManager{
//    static let shared = RealmManager()
//    let localRealm = try! Realm()
//    func saveRealm(info:infoObj){
//        try! localRealm.write{
//            localRealm.add(info)
//        }
//    }
//    func deleteRealm(info:infoObj){
//        try! localRealm.write{
//            localRealm.delete(info)
//        }
//    }
//    func deleteAllRealm(info:infoObj){
//        try! localRealm.write{
//            localRealm.deleteAll()
//        }
//    }
//}
class infoObj: Object{
    @objc dynamic var stringData: String?
}
