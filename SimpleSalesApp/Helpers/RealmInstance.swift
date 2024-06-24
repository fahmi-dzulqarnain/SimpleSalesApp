//
//  RealmInstance.swift
//  SimpleSalesApp
//
//  Created by Fahmi Dzulqarnain on 23/06/2024.
//

import Foundation
import RealmSwift

protocol RealmInstance {
    var realm: Realm { get }
}

extension RealmInstance {
    
    var realm: Realm {
        do {
            return try Realm()
        } catch {
            fatalError("Failed to open database \(error)")
        }
    }
    
    func writeToRealm(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch {
            print("Realm DB error: \(error)")
        }
    }
}
