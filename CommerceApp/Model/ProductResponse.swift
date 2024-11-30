//
//  ProductResponse.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/30/24.
//

import Foundation

struct Product: Decodable, Hashable {
    let id: Int
    let imageUrl: String
    let title: String
    let discount: String
    let originalPrice: Int
    let discountPrice: Int
}
