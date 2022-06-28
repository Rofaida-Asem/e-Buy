//
//  MainCategory.swift
//  e-Buy
//
//  Created by Om Malikah  on 26/11/1443 AH.
//

import Foundation

// MARK: - MainCategory
struct MainCategory: Decodable {
    let customcollections: [CustomCollection]
    
    enum CodingKeys: String, CodingKey {
        case customcollections = "custom_collections"
    }
}
// MARK: - CustomCollection
struct CustomCollection : Decodable {
    let id: Int?
    let handle, title: String?
    let updatedAt: Date?
    let bodyHTML: String?
    let publishedAt: Date?
    let sortOrder: String?
    //  let templateSuffix: NSNull?
    let publishedScope, adminGraphqlAPIID: String?
    let image: CategoryImage?
}

// MARK: - Image
struct CategoryImage : Decodable {
    let createdAt: Date?
    //    let alt: NSNull?
    let width, height: Int?
    let src: String?
}
