//
//  Product.swift
//  SimpleSalesApp
//
//  Created by Fahmi Dzulqarnain on 22/06/2024.
//

import Foundation
import RealmSwift

class Product: Object, Identifiable {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var name: String
    @Persisted var type: String
    @Persisted var price: Int
}
