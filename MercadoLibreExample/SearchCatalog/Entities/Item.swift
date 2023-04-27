//
//  Item.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 24/04/2023.
//

import Foundation

struct SearchResult: Codable {
    let siteID: String
    let query: String?
    let paging: Paging
    let results: [SearchResultItem]

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case query
        case paging
        case results
    }
}

struct Paging: Codable {
    let total: Int
    let offset: Int
    let limit: Int
    let primaryResults: Int

    enum CodingKeys: String, CodingKey {
        case total
        case offset
        case limit
        case primaryResults = "primary_results"
    }
}

struct SearchResultItem: Codable {
    let id: String
    let siteID: String
    let title: String
    let seller: Seller
    let price: Double
    let currencyID: String
    let availableQuantity: Int
    let soldQuantity: Int
    let buyingMode: String
    let listingTypeID: String
    let stopTime: String
    let condition: String
    let permalink: String
    let thumbnail: String
    let acceptsMercadoPago: Bool
//    let installments: Installments?
//    let address: Address?
//    let shipping: Shipping
//    let sellerAddress: SellerAddress?
//    let attributes: [Attribute]?
    let originalPrice: Double?
    let categoryID: String
    let officialStoreID: Int?
    let itemProductID: String?
    let tags: [String]
    let itemListing: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case siteID = "site_id"
        case title
        case seller
        case price
        case currencyID = "currency_id"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case buyingMode = "buying_mode"
        case listingTypeID = "listing_type_id"
        case stopTime = "stop_time"
        case condition
        case permalink
        case thumbnail
        case acceptsMercadoPago = "accepts_mercadopago"
//        case installments
//        case address
//        case shipping
//        case sellerAddress = "seller_address"
//        case attributes
        case originalPrice = "original_price"
        case categoryID = "category_id"
        case officialStoreID = "official_store_id"
        case itemProductID = "item_product_id"
        case tags
        case itemListing = "item_listing"
    }
}

struct Seller: Codable {
    let id: Int
    let powerSellerStatus: String?
    let carDealer: Bool
    let realEstateAgency: Bool
    let tags: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case powerSellerStatus = "power_seller_status"
        case carDealer = "car_dealer"
        case realEstateAgency = "real_estate_agency"
        case tags
    }
}

struct Installments: Codable {
    let quantity: Int
    let amount: Double
    let rate: Double
    let currencyID: String

    enum CodingKeys: String, CodingKey {
        case quantity
        case amount
        case rate
        case currencyID = "currency_id"
    }
}

struct Address: Codable {
    let stateID: String
    let stateName: String
    let cityID: String?
    let cityName: String?
    
    enum CodingKeys: String, CodingKey {
        case stateID = "state_id"
        case stateName = "state_name"
        case cityID = "city_id"
        case cityName = "city_name"
    }
}

struct Attribute: Codable {
    let name: String
    let valueId: String
    let valueName: String
    let valueStruct: String?
    let attributeGroupId: String
    let attributeGroupName: String
    let source: Int
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case valueId = "value_id"
        case valueName = "value_name"
        case valueStruct = "value_struct"
        case attributeGroupId = "attribute_group_id"
        case attributeGroupName = "attribute_group_name"
        case source
        case id
    }
}

struct Shipping: Codable {
    let freeShipping: Bool
    let mode: String
    let tags: [String]
    let logisticType: String
    let storePickUp: Bool

    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case mode
        case tags
        case logisticType = "logistic_type"
        case storePickUp = "store_pick_up"
    }
}

struct SellerAddress: Codable {
    let country: Country
    let state: State
    let city: City
    let latitude: String
    let longitude: String
}

struct Country: Codable {
    let id: String
    let name: String
}

struct State: Codable {
    let id: String
    let name: String
}

struct City: Codable {
    let id: String
    let name: String
}

struct Response: Codable {
    let shipping: Shipping
    let sellerAddress: SellerAddress

    enum CodingKeys: String, CodingKey {
        case shipping
        case sellerAddress = "seller_address"
    }
}

struct Item {
    let title: String
    let price: Double
    let availableQuantity: Int
    let soldQuantity: Int
    let typeCell: SearchItemCellType
    let thumbnail: String
}
