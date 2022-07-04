//
//  NetworkManager.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 22/06/2022.
//

import Foundation

// MARK: - Products
struct Products: Decodable {
    let products: [Product]?
}

// MARK: - Product
struct Product: Decodable {
    let id: Int?
    let title, vendor: String?
    let productType: String?
   
    //    let handle: String?
    //    let updatedAt, publishedAt: Date?
    //    let templateSuffix: NSNull?
    //    let publishedScope, tags, adminGraphqlAPIID: String?
    let variants: [Variant]?
    let options: [Option]?
    let images: [ProductImage]?
    let image: ProductImage?
    
    enum CodingKeys: String, CodingKey {
         
        case productType = "product_type"
        case title = "title"
        case vendor = "vendor"
        case variants = "variants"
        case images = "images"
        case image = "image"
        case options = "options"
        case id = "id"
       
    }
}

// MARK: - Image
struct ProductImage: Decodable {
    let id, product_id, position: Int?
    let createdAt, updatedAt: Date?
 //   let alt: NSNull
    let width, height: Int?
    let src: String?
    let variantIDS: [Int]?
    let adminGraphqlAPIID: String?
}

// MARK: - Option
struct Option: Decodable {
    let id, product_id: Int?
    let name: String?
    let position: Int?
    let values: [String]?
}

// MARK: - Variant
struct Variant: Decodable {
    let id, product_id: Int?
    let title, price, sku: String?
 //   let position: Int?
 //   let inventoryPolicy: String?
//    let compareAtPrice: NSNull?
 //   let fulfillmentService, inventoryManagement, option1: String?
 //   let option2, option3: NSNull?
 //   let createdAt, updatedAt: Date?
 //   let taxable: Bool?
 //   let barcode: String?
 //   let grams: Int?
//    let imageID: Int?
//    let weight: Double?
//    let weightUnit: String?
//    let inventoryItemID, inventoryQuantity, oldInventoryQuantity: Int?
    let presentmentPrices: [PresentmentPrice]?
 //   let requiresShipping: Bool?
 //   let adminGraphqlAPIID: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
  case product_id   
        case title = "title"
        case price = "price"
        case sku = "sku"
//        case position = "position"
//        case options = "options"
//        case inventoryPolicy = "inventoryPolicy"
//        case fulfillmentService = "fulfillmentService"
//        case inventoryManagement = "inventoryManagement"
//        case option1 = "option1"
//        case createdAt = "createdAt"
//        case updatedAt = "updatedAt"
//        case taxable = "taxable"
//        case barcode = "barcode"
//        case grams = "grams"
//        case imageID = "imageID"
//        case weight = "weight"
//        case weightUnit = "weightUnit"
//        case inventoryItemID = "inventoryItemID"
//        case inventoryQuantity = "inventoryQuantity"
//        case oldInventoryQuantity = "oldInventoryQuantity"
//        case requiresShipping = "requiresShipping"
        case presentmentPrices = "presentmentPrices"
    }
}

// MARK: - PresentmentPrice
struct PresentmentPrice: Decodable {
    let price: Price?
  //  let compareAtPrice: NSNull?
}

// MARK: - Price
struct Price:Decodable {
    let amount, currencyCode: String?
}
