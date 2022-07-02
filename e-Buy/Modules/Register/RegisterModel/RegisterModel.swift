import Foundation

// MARK: - Register
struct Register: Codable {
    var customer: Customer?
}

// MARK: - Customer
struct Customer: Codable {
    var id: Int?
    var email: String?
    var acceptsMarketing: Bool?
    var createdAt, updatedAt: String?
    var firstName, lastName: String?
    var ordersCount: Int?
    var state, totalSpent: String?
    var verifiedEmail: Bool?
    var taxExempt: Bool?
    var currency: String?
    enum CodingKeys: String, CodingKey {
        case id , email
        case acceptsMarketing = "accepts_marketing"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case firstName = "first_name"
        case lastName = "last_name"
        case ordersCount = "orders_count"
        case state
        case totalSpent = "total_spent"
        case verifiedEmail = "verified_email"
        case taxExempt = "tax_exempt"
        case currency
    }
}
