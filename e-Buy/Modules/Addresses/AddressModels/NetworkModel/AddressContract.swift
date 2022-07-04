//
//  AddressContract.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 02/07/2022.
//

import Foundation

struct AddressesContract: Codable{
    
    let addresses : [Addresses]?

    enum CodingKeys: String, CodingKey {

        case addresses = "addresses"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        addresses = try values.decodeIfPresent([Addresses].self, forKey: .addresses)
    }

}
