//
//  CardPrices.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 22/02/23.
//

import Foundation

struct CardPrices: Decodable {
    private let cardmarketPrice: String
    private let tcgplayerPrice: String
    private let ebayPrice: String
    private let amazonPrice: String
    private let coolstuffincPrice: String
    
    enum CodingKeys: String, CodingKey {
        case cardmarketPrice = "cardmarket_price"
        case tcgplayerPrice = "tcgplayer_price"
        case ebayPrice = "ebay_price"
        case amazonPrice = "amazon_price"
        case coolstuffincPrice = "coolstuffinc_price"
    }
}
