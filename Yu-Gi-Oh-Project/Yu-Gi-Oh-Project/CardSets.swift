//
//  CardSets.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 22/02/23.
//

import Foundation

struct CardSets: Decodable {
    private let setName: String
    private let setCode: String
    private let setRarity: String
    private let setRarityCode: String
    private let setprice: String
    
    enum CodingKeys: String, CodingKey {
        case setName = "set_name"
        case setCode = "set_code"
        case setRarity = "set_rarity"
        case setRarityCode = "set_rarity_code"
        case setprice = "set_price"
    }
}
