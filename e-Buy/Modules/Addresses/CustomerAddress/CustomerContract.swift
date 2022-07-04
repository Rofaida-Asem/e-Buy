//
//  CustomerContract.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 03/07/2022.
//

import Foundation

struct CustomarContract: Codable {
    let customer : Customer?

    enum CodingKeys: String, CodingKey {

        case customer = "customer"
    }
    
}

//struct LoginResponse: Codable {
//    let customers: [Customer]
//}



extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
