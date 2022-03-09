//
//  Persistance.swift
//  hw14-data
//
//  Created by gleba on 27.02.2022.
//

import Foundation
class Persistance{
    static let sharedTx1 = Persistance()
    private let kText1Key = "Persistance.kText1Key"
    
    var text1: String?{
        set{UserDefaults.standard.set(newValue, forKey: kText1Key)}
        get{return UserDefaults.standard.string(forKey: kText1Key)}
    }
    private let kText2Key = "Persistance.kText2Key"
    
    var text2: String?{
        set{UserDefaults.standard.set(newValue, forKey: kText2Key)}
        get{return UserDefaults.standard.string(forKey: kText2Key)}
    }
    private let markKey = "Persistance.markKey"
    var mark: Bool{
        set{UserDefaults.standard.set(newValue, forKey: markKey)}
        get{UserDefaults.standard.bool(forKey: markKey)}
    }
}
