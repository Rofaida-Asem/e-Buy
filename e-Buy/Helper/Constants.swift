//
//  Constants.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 22/06/2022.
//

import Foundation

class Constants {
    
    private static let apiKey = "https://fde429753a207f610321a557c2e0ceb0:"
    private static let password = "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"
    private static let hostname = "@menofia-2022-q3.myshopify.com"
    private static let version = "/admin/api/2022-04"
    private static let smartCollection = "/smart_collections.json"
    private static let products = "/products.json"
    private static let custemCollections = "/custom_collections.json"
    private static let collections = "/collections"
    private static let orders = "/orders.json"
    class func getBrands_URL() -> String {
        return Constants.apiKey + Constants.password + Constants.hostname + Constants.version + Constants.smartCollection
    }
    
    class func getProducts_URL() -> String {
        return Constants.apiKey + Constants.password + Constants.hostname + Constants.version + Constants.products
    }
    
    class func getCustomCollection_URL() -> String {
        return Constants.apiKey + Constants.password + Constants.hostname + Constants.version + Constants.custemCollections
    }
    
    class func getMinCategory_URL(collectionId: Int) -> String {
        return Constants.apiKey + Constants.password + Constants.hostname + Constants.version + Constants.collections + ("/\(collectionId)") + Constants.products
    }
    
    class func getOrders_URL() -> String {
        return Constants.apiKey + Constants.password + Constants.hostname + Constants.version + Constants.orders
    }
     
}

func addressById(userId : Int,addressId : Int)->String{
    let url = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/customers/\(userId)/addresses/\(addressId).json"
    return url
}


func allAddresses (userId : Int)->String{
    let url = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/customers/\(userId)/addresses.json"
    return url
}

func customerById (userId : Int)->String{
    let url = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/customers/\(userId).json"
    return url
}

// let smartCollection = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/smart_collections/286861033643.json"

// let custonCollection = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/custom_collections.json"

// let orders = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/orders.json"

// let customCollectionWithIdCollection = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/collections/286861394091/products.json"

//let productsURL = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/products.json"
//
//let customers = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/customers.json"
//
//let customCollections = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/custom_collections.json"
//
//let orders = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/orders.json"
//
//let countries = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/countries.json"
//
//let currencies = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/currencies.json"
//
//let productsForCustomCollection = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/products.json?collection_id=286860542123"
//
//let singleProductUrl = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/products/7358110630059.json"


