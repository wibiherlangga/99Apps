//
//  Property.swift
//  99Apps
//
//  Created by herlangga wibi on 08/08/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import Foundation

struct Property: Codable {
    let meta: Meta
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let list: [List]
    let pagination: Pagination
}

// MARK: - List
struct List: Codable {
    let id, title: String
    let type: ListType
    let image: String
    let listDescription: String
    let agent: Agent
    let location: Location
    let attribute: Attribute
    let isPremium: String
    let fasilities: Fasilities

    enum CodingKeys: String, CodingKey {
        case id, title, type, image
        case listDescription = "description"
        case agent, location, attribute
        case isPremium = "is_premium"
        case fasilities
    }
}

// MARK: - Agent
struct Agent: Codable {
    let id, name: String
    let type: AgentType
    let photo: String
}

enum AgentType: String, Codable {
    case agentIndependen = "Agent Independen"
    case agentProfesional = "Agent Profesional"
}

// MARK: - Attribute
struct Attribute: Codable {
    let price, bedrooms, bathrooms, floor: String
    let buildingSize, landSize: String

    enum CodingKeys: String, CodingKey {
        case price, bedrooms, bathrooms, floor
        case buildingSize = "building_size"
        case landSize = "land_size"
    }
}

enum Fasilities: String, Codable {
    case bebasBanjirDekatKampus = "Bebas banjir, Dekat Kampus"
}

// MARK: - Location
struct Location: Codable {
    let latitude, longitude, address: String
}

enum ListType: String, Codable {
    case dijual = "dijual"
}

// MARK: - Pagination
struct Pagination: Codable {
    let limit, totalPage, totalRows, currentPage: Int

    enum CodingKeys: String, CodingKey {
        case limit
        case totalPage = "total_page"
        case totalRows = "total_rows"
        case currentPage = "current_page"
    }
}

// MARK: - Meta
struct Meta: Codable {
    let code: Int
    let status: Bool
    let message: String
}
