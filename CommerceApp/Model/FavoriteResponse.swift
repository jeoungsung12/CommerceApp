//
//  FavoriteResponse.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/30/24.
//

import Foundation

struct FavoriteResponse: Decodable {
    let favorites: [Product]
}
