//
//  AddressModel.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 02/07/2022.
//

import Foundation
struct Addresses : Codable {
    
    var address1, address2, city, province, phone: String?
    var zip, name, country: String?
    var id: Int!
    
}
