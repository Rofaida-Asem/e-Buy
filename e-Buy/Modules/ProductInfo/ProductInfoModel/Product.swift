//
//  Product.swift
//  e-Buy
//
//  Created by salah waleed on 02/07/2022.
//

import Foundation

// MARK: - Singleproduct
struct Singleproduct: Codable {
    var product: Productt?
}

// MARK: - Product
struct Productt: Codable {
    var id: Int?
    var title, bodyHTML, vendor, productType: String?
    var createdAt: String?
    var handle: String?
    var updatedAt, publishedAt: String?
 
    var status, publishedScope, tags, adminGraphqlAPIID: String?
    var variants: [Variants]?
    var options: [Ooption]?
    var images: [Imagee]?
    var image: Imagee?

    enum CodingKeys: String, CodingKey {
        case id, title
        case bodyHTML = "body_html"
        case vendor
        case productType = "product_type"
        case createdAt = "created_at"
        case handle
        case updatedAt = "updated_at"
        case publishedAt = "published_at"
  
        case status
        case publishedScope = "published_scope"
        case tags
        case adminGraphqlAPIID = "admin_graphql_api_id"
        case variants, options, images, image
    }
}

// MARK: - Image
struct Imagee: Codable {
    var id, productID, position: Int?
    var createdAt, updatedAt: String?
 
    var width, height: Int?
    var src: String?
 

    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case position
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case  width, height, src
 
    }
}

// MARK: - Option
struct Ooption: Codable {
    var id, productID: Int?
    var name: String?
    var position: Int?
    var values: [String]?

    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case name, position, values
    }
}

// MARK: - Variant
struct Variants: Codable {
    var id, productID: Int?
    var title, price, sku: String?
    var position: Int?
    var inventoryPolicy: String?
 
    var fulfillmentService, inventoryManagement, option1, option2: String?
  
    var createdAt, updatedAt: String?
    var taxable: Bool?
   
    var grams: Int?
    
    var weight: Int?
    var weightUnit: String?
    var inventoryItemID, inventoryQuantity, oldInventoryQuantity: Int?
    var requiresShipping: Bool?
   

    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case title, price, sku, position
        case inventoryPolicy = "inventory_policy"
 
        case fulfillmentService = "fulfillment_service"
        case inventoryManagement = "inventory_management"
        case option1, option2
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case taxable, grams
    
        case weight
        case weightUnit = "weight_unit"
        case inventoryItemID = "inventory_item_id"
        case inventoryQuantity = "inventory_quantity"
        case oldInventoryQuantity = "old_inventory_quantity"
        case requiresShipping = "requires_shipping"
        
    }
}

 
