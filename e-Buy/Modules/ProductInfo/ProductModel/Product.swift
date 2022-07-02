////
////  Product.swift
////  e-Buy
////
////  Created by salah waleed on 30/06/2022.
////
//
//import Foundation
// 
//
//import Foundation
//
//// MARK: - Products
//struct Products: Codable {
//    var product: Product?
//}
//
//// MARK: - Product
//struct Product: Codable {
//    var id: Int?
//    var title, bodyHTML, vendor, productType: String?
//    var createdAt: Date?
//    var handle: String?
//    var updatedAt, publishedAt: Date?
// 
//    var status, publishedScope, tags, adminGraphqlAPIID: String?
//    var variants: [Variant]?
//    var options: [Option]?
//    var images: [Image]?
//    var image: Image?
//
//    enum CodingKeys: String, CodingKey {
//        case id, title
//        case bodyHTML = "body_html"
//        case vendor
//        case productType = "product_type"
//        case createdAt = "created_at"
//        case handle
//        case updatedAt = "updated_at"
//        case publishedAt = "published_at"
//        case templateSuffix = "template_suffix"
//        case status
//        case publishedScope = "published_scope"
//        case tags
//        case adminGraphqlAPIID = "admin_graphql_api_id"
//        case variants, options, images, image
//    }
//}
//
//// MARK: - Image
//struct Image: Codable {
//    var id, productID, position: Int?
//    var createdAt, updatedAt: Date?
// 
//    var width, height: Int?
//    var src: String?
//    var variantIDS: [Int]?
//    var adminGraphqlAPIID: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case productID = "product_id"
//        case position
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case alt, width, height, src
//        case variantIDS = "variant_ids"
//        case adminGraphqlAPIID = "admin_graphql_api_id"
//    }
//}
//
//// MARK: - Option
//struct Option: Codable {
//    var id, productID: Int?
//    var name: String?
//    var position: Int?
//    var values: [String]?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case productID = "product_id"
//        case name, position, values
//    }
//}
//
//// MARK: - Variant
//struct Variant: Codable {
//    var id, productID: Int?
//    var title, price, sku: String?
//    var position: Int?
//    var inventoryPolicy: String?
//    var compareAtPrice: String?
//    var fulfillmentService, inventoryManagement, option1: String?
//    var option2, option3: String?
//    var createdAt, updatedAt: Date?
//    var taxable: Bool?
//    var barcode: String?
//    var grams: Int?
//    var imageID: Int?
//    var weight: Double?
//    var weightUnit: String?
//    var inventoryItemID, inventoryQuantity, oldInventoryQuantity: Int?
//    var presentmentPrices: [PresentmentPrice]?
//    var requiresShipping: Bool?
//    var adminGraphqlAPIID: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case productID = "product_id"
//        case title, price, sku, position
//        case inventoryPolicy = "inventory_policy"
//        case compareAtPrice = "compare_at_price"
//        case fulfillmentService = "fulfillment_service"
//        case inventoryManagement = "inventory_management"
//        case option1, option2, option3
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case taxable, barcode, grams
//        case imageID = "image_id"
//        case weight
//        case weightUnit = "weight_unit"
//        case inventoryItemID = "inventory_item_id"
//        case inventoryQuantity = "inventory_quantity"
//        case oldInventoryQuantity = "old_inventory_quantity"
//        case presentmentPrices = "presentment_prices"
//        case requiresShipping = "requires_shipping"
//        case adminGraphqlAPIID = "admin_graphql_api_id"
//    }
//}
//
//// MARK: - PresentmentPrice
//struct PresentmentPrice: Codable {
//    var price: Price?
//    var compareAtPrice: String?
//
//    enum CodingKeys: String, CodingKey {
//        case price
//        case compareAtPrice = "compare_at_price"
//    }
//}
//
//// MARK: - Price
//struct Price: Codable {
//    var amount, currencyCode: String?
//
//    enum CodingKeys: String, CodingKey {
//        case amount
//        case currencyCode = "currency_code"
//    }
//}
//
// 
