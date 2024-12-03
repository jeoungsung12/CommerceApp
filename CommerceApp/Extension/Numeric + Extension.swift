//
//  Numeric + Extension.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/28/24.
//

import Foundation

extension Numeric {
    var moneyString: String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return (formatter.string(for: self) ?? "") + "원"
        
    }
}
