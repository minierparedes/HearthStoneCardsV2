//
//  HearthStoneCard.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import Foundation


struct HearthStoneCard: Decodable {
    struct PlayRequirements: Decodable {
        let reqMinionTarget: Int?
        let reqTargetToPlay: Int?
        enum CodingKeys: String, CodingKey {
            case reqMinionTarget = "REQ_MINION_TARGET"
            case reqTargetToPlay = "REQ_TARGET_TO_PLAY"
        }
    }
    let artist: String?
    let attack: Int?
    let cardClass: String?
    let collectible: Bool?
    let cost: Int?
    let dbfId: Int?
    let faction: String?
    let health: Int?
    let flavor: String?
    let id: String?
    let name: String?
    let playRequirements: PlayRequirements?
    let rarity: String?
    let referencedTags: [String]?
    let mechanics: [String]?
    let set: String?
    let text: String?
    let type: String?
    var cardImageURL: URL {
        let urlString = "https://art.hearthstonejson.com/v1/256x/\(id!).jpg"
        return URL(string: urlString)!
    }
}
