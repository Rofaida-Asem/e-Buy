//
//  BrandsModel.swift
//  e-Buy
//
//  Created by Om Malikah  on 24/11/1443 AH.
//

import Foundation

// MARK: - Brands
struct Brands: Decodable {
    let smartcollections: [SmartCollection]
    
    enum CodingKeys: String, CodingKey {
        case smartcollections = "smart_collections"
    }
}

// MARK: - SmartCollection
struct SmartCollection: Decodable {
    let id: Int?
    let handle, title: String?
    let updatedAt: Date?
    let bodyHTML: String?
    let publishedAt: Date?
    let sortOrder: SortOrder?
 
    let disjunctive: Bool?
    let rules: [Rule]?
    let publishedScope: PublishedScope?
    let adminGraphqlAPIID: String?
    let image: Image?
}

// MARK: - Image
struct Image: Decodable {
    let createdAt: Date?
 //   let alt: NSNull
    let position:Int?
    let width, height: Int?
    let src: String?
}

enum PublishedScope: Decodable {
    case web
}

// MARK: - Rule
struct Rule: Decodable {
    let column: String?
    let relation: String?
    let condition: String?
}

enum Column: Decodable {
    case title
}

enum Relation: Decodable {
    case contains
}

enum SortOrder: Decodable {
    case bestSelling
}
