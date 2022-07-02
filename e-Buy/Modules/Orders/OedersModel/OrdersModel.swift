////
////  OrdersModel.swift
////  e-Buy
////
////  Created by Om Malikah  on 28/11/1443 AH.
////
//
//import Foundation
//
//// MARK: - Orders
//struct Orders: Decodable {
//    let orders: [Order]?
//}
//
//// MARK: - Order
//struct Order: Decodable {
//    let id: Int?
//    let adminGraphqlAPIID: String?
//    let appID: Int?
////    let browserIP: NSNull?
////    let buyerAcceptsMarketing: Bool?
////    let cancelReason, cancelledAt, cartToken, checkoutID: NSNull?
////    let checkoutToken, closedAt: NSNull?
//    let confirmed: Bool?
//    let contactEmail: Email?
//    let createdAt: Date?
//    let currency: Currency?
//    let currentSubtotalPrice: String?
//    let currentSubtotalPriceSet: Set?
//    let currentTotalDiscounts: String?
//    let currentTotalDiscountsSet: Set?
////    let currentTotalDutiesSet: NSNull?
//    let currentTotalPrice: String?
//    let currentTotalPriceSet: Set?
//    let currentTotalTax: String?
//    let currentTotalTaxSet: Set?
////    let customerLocale, deviceID: NSNull?
//    let discountCodes: [Any?]?
//    let email: Email?
//    let estimatedTaxes: Bool?
//    let financialStatus: FinancialStatus?
////    let fulfillmentStatus: NSNull?
//    let gateway: String?
////    let landingSite, landingSiteRef, locationID: NSNull?
//    let name: String?
// //   let note: NSNull?
//    let noteAttributes: [Any?]?
//    let number, orderNumber: Int?
//    let orderStatusURL: String?
// //   let originalTotalDutiesSet: NSNull?
//    let paymentGatewayNames: [Any?]?
// //   let phone: NSNull?
//    let presentmentCurrency: Currency?
//    let processedAt: Date?
//    let processingMethod: String?
////    let reference, referringSite, sourceIdentifier: NSNull?
//    let sourceName: String?
//    let sourceURL: NSNull?
//    let subtotalPrice: String?
//    let subtotalPriceSet: Set?
//    let tags: OrderTags?
//    let taxLines: [Any?]?
//    let taxesIncluded, test: Bool?
//    let token, totalDiscounts: String?
//    let totalDiscountsSet: Set?
//    let totalLineItemsPrice: String?
//    let totalLineItemsPriceSet: Set?
//    let totalOutstanding, totalPrice: String?
//    let totalPriceSet: Set?
//    let totalPriceUsd: String?
//    let totalShippingPriceSet: Set?
//    let totalTax: String?
//    let totalTaxSet: Set?
//    let totalTipReceived: String?
//    let totalWeight: Int?
//    let updatedAt: Date?
////    let userID: NSNull?
//    let billingAddress: Address?
//    let customer: Customer?
//    let discountApplications, fulfillments: [Any?]?
//    let lineItems: [LineItem]?
////    let paymentTerms: NSNull?
//    let refunds: [Any?]?
//    let shippingAddress: Address?
//    let shippingLines: [Any?]?
//}
//
//// MARK: - Address
//struct Address: Decodable {
//    let firstName: FirstName?
//    let address1: Address1?
//    let phone: String?
//    let city: City?
//    let zip: String?
//    let province: Province?
//    let country: Country?
//    let lastName: LastName?
//    let address2, company, latitude, longitude: NSNull?
//    let name: Name?
//    let countryCode: CountryCode?
////    let provinceCode: NSNull?
//    let id, customerID: Int?
//    let countryName: Country?
//    let addressDefault: Bool?
//}
//
//enum Address1: Decodable {
//    case ap1475705NonummyStreet
//    case the206127EgestasStreet
//    case the8887731BlanditSt
//    case the9132468IDAve
//}
//
//enum City: Decodable {
//    case gulfport
//    case maubeuge
//    case palmerston
//    case salem
//}
//
//enum Country: Decodable {
//    case equatorialGuinea
//    case eritrea
//    case france
//    case nicaragua
//}
//
//enum CountryCode: Decodable {
//    case er
//    case fr
//    case gq
//    case ni
//}
//
//enum FirstName: Decodable {
//    case brennan
//    case henry
//    case keefe
//    case octavius
//}
//
//enum LastName: Decodable {
//    case lynch
//    case mccoy
//    case mullins
//    case short
//}
//
//enum Name: Decodable {
//    case brennanLynch
//    case henryShort
//    case keefeMccoy
//    case octaviusMullins
//}
//
//enum Province: Decodable {
//    case marseille
//    case mississippi
//    case nordPasDeCalais
//    case oregon
//}
//
//enum Email: Decodable {
//    case egnitionSample17EgnitionCOM
//    case egnitionSample29EgnitionCOM
//    case egnitionSample55EgnitionCOM
//    case egnitionSample84EgnitionCOM
//}
//
//enum Currency: Decodable {
//    case egp
//}
//
//// MARK: - Set
//struct Set: Decodable {
//    let shopMoney, presentmentMoney: Money?
//}
//
//// MARK: - Money
//struct Money: Decodable {
//    let amount: String?
//    let currencyCode: Currency?
//}
//
//// MARK: - Customer
//struct Customer: Decodable {
//    let id: Int?
//    let email: Email?
//    let acceptsMarketing: Bool?
//    let createdAt, updatedAt: Date?
//    let firstName: FirstName?
//    let lastName: LastName?
//    let ordersCount: Int?
//    let state: CustomerState?
//    let totalSpent: String?
//    let lastOrderID: Int?
////    let note: NSNull?
//    let verifiedEmail: Bool?
////    let multipassIdentifier: NSNull?
//    let taxExempt: Bool?
//    let phone: String?
//    let tags: CustomerTags?
//    let lastOrderName: LastOrderName?
//    let currency: Currency?
//    let acceptsMarketingUpdatedAt: Date?
////    let marketingOptInLevel: NSNull?
//    let taxExemptions: [Any?]?
//    let emailMarketingConsent, smsMarketingConsent: MarketingConsent?
//    let adminGraphqlAPIID: AdminGraphqlAPIID?
//    let defaultAddress: Address?
//}
//
//enum AdminGraphqlAPIID: Decodable {
//    case gidShopifyCustomer6048027574443
//    case gidShopifyCustomer6048027607211
//    case gidShopifyCustomer6048027639979
//    case gidShopifyCustomer6048027672747
//}
//
//// MARK: - MarketingConsent
//struct MarketingConsent: Decodable {
//    let state: EmailMarketingConsentState?
//    let optInLevel: OptInLevel?
////    let consentUpdatedAt: NSNull?
//    let consentCollectedFrom: ConsentCollectedFrom?
//}
//
//enum ConsentCollectedFrom: Decodable {
//    case other
//}
//
//enum OptInLevel: Decodable {
//    case singleOptIn
//}
//
//enum EmailMarketingConsentState: Decodable {
//    case notSubscribed
//}
//
//enum LastOrderName: Decodable {
//    case the1012
//    case the1018
//    case the1019
//    case the1020
//}
//
//enum CustomerState: Decodable {
//    case disabled
//}
//
//enum CustomerTags: Decodable {
//    case egnitionSampleDataReferral
//    case egnitionSampleDataVIP
//}
//
//enum FinancialStatus: Decodable {
//    case paid
//    case pending
//    case refunded
//}
//
//// MARK: - LineItem
//struct LineItem: Decodable {
//    let id: Int?
//    let adminGraphqlAPIID: String?
//    let fulfillableQuantity: Int?
//    let fulfillmentService: FulfillmentService?
////    let fulfillmentStatus: NSNull?
//    let giftCard: Bool?
//    let grams: Int?
//    let name, price: String?
//    let priceSet: Set?
//    let productExists: Bool?
//    let productID: Int?
//    let properties: [Any?]?
//    let quantity: Int?
//    let requiresShipping: Bool?
//    let sku: String?
//    let taxable: Bool?
//    let title, totalDiscount: String?
//    let totalDiscountSet: Set?
//    let variantID: Int?
//    let variantInventoryManagement: VariantInventoryManagement?
//    let variantTitle: String?
//    let vendor: Vendor?
//    let taxLines, duties, discountAllocations: [Any?]?
//}
//
//enum FulfillmentService: Decodable {
//    case manual
//}
//
//enum VariantInventoryManagement: Decodable {
//    case shopify
//}
//
//enum Vendor: Decodable {
//    case adidas
//    case converse
//    case drMartens
//    case nike
//    case timberland
//    case vans
//}
//
//enum OrderTags: Decodable {
//    case egnitionSampleData
//}
