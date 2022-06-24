//
//  CurrenciesContract.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 24/06/2022.
//

import Foundation

struct CurrenciesContract : Codable {
    let currencies : [Currencies]?

    enum CodingKeys: String, CodingKey {

        case currencies = "currencies"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        currencies = try values.decodeIfPresent([Currencies].self, forKey: .currencies)
    }

}
