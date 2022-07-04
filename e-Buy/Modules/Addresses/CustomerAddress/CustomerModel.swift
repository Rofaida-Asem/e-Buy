//
//  CustomerModel.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 03/07/2022.
//

import Foundation

struct Customer: Codable {
    let first_name, last_name, email, phone, tags, note: String?
    let id: Int?
    let verified_email: Bool?
    let addresses:  [Addresses]?
}

struct CustomerAddress: Codable {
    var addresses: [Addresses]?
}

struct UpdateAddress: Codable {
    var address: Addresses
}

struct PutAddress: Codable {
    let customer: CustomerAddress?
}

enum CodingKeys: String, CodingKey {
    case id = "id"
    case email = "email"
    case accepts_marketing = "accepts_marketing"
    case created_at = "created_at"
    case updated_at = "updated_at"
    case first_name = "first_name"
    case last_name = "last_name"
    case orders_count = "orders_count"
    case state = "state"
    case total_spent = "total_spent"
    case last_order_id = "last_order_id"
    case note = "note"
    case verified_email = "verified_email"
    case multipass_identifier = "multipass_identifier"
    case tax_exempt = "tax_exempt"
    case phone = "phone"
    case tags = "tags"
    case last_order_name = "last_order_name"
    case currency = "currency"
    case addresses = "addresses"
    case accepts_marketing_updated_at = "accepts_marketing_updated_at"
    case marketing_opt_in_level = "marketing_opt_in_level"
    case tax_exemptions = "tax_exemptions"
    case default_address = "default_address"
}
