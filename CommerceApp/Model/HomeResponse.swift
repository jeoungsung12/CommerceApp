//
//  HomeResponse.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/28/24.
//

import Foundation

struct HomeResponse: Decodable, Hashable {
    let banners: [Banner]
    let horizontalProducts: [Product]
    let verticalProducts: [Product]
    let themes: [Banner]
}

struct Banner: Decodable, Hashable {
    let id: Int
    let imageUrl: String
}

struct Product: Decodable, Hashable {
    let id: Int
    let imageUrl: String
    let title: String
    let discount: String
    let originalPrice: Int
    let discountPrice: Int
}