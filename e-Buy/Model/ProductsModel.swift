//
//  NetworkManager.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 22/06/2022.
//

import Foundation


// MARK: - Products
struct Products: Decodable {
    let products: [Product]
}

// MARK: - Product
struct Product: Decodable {
    let id: Int
    let title, bodyHTML, vendor, productType: String
    let createdAt: Date
    let handle: String
    let updatedAt, publishedAt: Date
    let templateSuffix: NSNull
    let publishedScope, tags, adminGraphqlAPIID: String
    let variants: [Variant]
    let options: [Option]
    let images: [Image]
    let image: Image?
}

// MARK: - Image
struct Image {
    let id, productID, position: Int
    let createdAt, updatedAt: Date
    let alt: NSNull
    let width, height: Int
    let src: String
    let variantIDS: [Int]
    let adminGraphqlAPIID: String
}

// MARK: - Option
struct Option {
    let id, productID: Int
    let name: String
    let position: Int
    let values: [String]
}

// MARK: - Variant
struct Variant {
    let id, productID: Int
    let title, price, sku: String
    let position: Int
    let inventoryPolicy: String
    let compareAtPrice: NSNull
    let fulfillmentService, inventoryManagement, option1: String
    let option2, option3: NSNull
    let createdAt, updatedAt: Date
    let taxable: Bool
    let barcode: String
    let grams: Int
    let imageID: Int?
    let weight: Double
    let weightUnit: String
    let inventoryItemID, inventoryQuantity, oldInventoryQuantity: Int
    let presentmentPrices: [PresentmentPrice]
    let requiresShipping: Bool
    let adminGraphqlAPIID: String
}

// MARK: - PresentmentPrice
struct PresentmentPrice {
    let price: Price
    let compareAtPrice: NSNull
}

// MARK: - Price
struct Price {
    let amount, currencyCode: String
}
