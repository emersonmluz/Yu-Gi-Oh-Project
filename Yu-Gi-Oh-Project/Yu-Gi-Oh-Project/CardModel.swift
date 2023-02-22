//
//  CardModel.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 22/02/23.
//

import Foundation

struct CardModel: Decodable {
    private let id: Int
    private let name: String
    private let type: String
    private let frameType: String
    private let description: String
    private let atk: Int?
    private let def: Int?
    private let level: Int?
    private let style: String
    private let attribute: String?
    //private let sets: [CardSets]
    private let images: [CardImages]
    //private let prices: [CardPrices]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case frameType
        case description = "desc"
        case atk
        case def
        case level
        case style = "race"
        case attribute
        //case sets = "card_sets"
        case images = "card_images"
        //case prices = "card_prices"
    }
}
