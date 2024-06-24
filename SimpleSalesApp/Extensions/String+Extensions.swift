//
//  String+Extensions.swift
//  SimpleSalesApp
//
//  Created by Fahmi Dzulqarnain on 22/06/2024.
//

import Foundation

extension String {
    
    var withThousandSeparator: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        
        let number = NSNumber(value: Int(self.withoutSeparator) ?? 0)
        return formatter.string(from: number) ?? ""
    }
    
    var withoutSeparator: String {
        self.replacingOccurrences(of: ".", with: "")
    }
}
