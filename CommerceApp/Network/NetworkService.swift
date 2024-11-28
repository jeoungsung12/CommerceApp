//
//  NetworkService.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/28/24.
//

import Foundation

class NetworkService {
    static let shared: NetworkService = NetworkService()
    
    func getHomeData() async throws -> HomeResponse {
        let urlString: String = "https://my-json-server.typicode.com/JeaSungLEE/JsonAPIFastCampus/db"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw URLError(.badServerResponse) }
        let decodeData = try JSONDecoder().decode(HomeResponse.self, from: data)
        return decodeData
    }
}
