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
    private static let products = "products.json"
    
    class func getProducts_URL() -> String {
        return Constants.apiKey + Constants.password + Constants.hostname + Constants.version + Constants.products
    }
}

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


