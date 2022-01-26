//
//  Response.swift
//  SwiftUITableDemo
//
//  Created by Sam Lai on 2022/1/25.
//

import Foundation
enum ResponseKey: String, CodingKey {
    case info, results
}

struct Info: Hashable, Codable {
    var seed: String
    var results: Int
    var page: Int
    var version: String
}

struct Response: Hashable {
    var info: Info
    var results: [User]
}

extension Response: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseKey.self)
        info = try container.decode(Info.self, forKey: .info)
        results = try container.decode([User].self, forKey: .results)
    }
}
