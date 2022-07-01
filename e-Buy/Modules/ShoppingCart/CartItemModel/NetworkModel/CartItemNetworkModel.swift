//
//  CartItemNetworkModel.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 01/07/2022.
//

import Foundation

struct CartItemNetworkModel: Codable {
    let name:String
    let price: String
    let imgUrl: String
    let id: String
    let qty:String
    let variant_id:String

    
}
