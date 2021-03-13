//
//  HearthStoneCard.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import Foundation


struct HearthStoneCard: Codable, Equatable, Identifiable {
        //let cardID: UUID
        let artist : String
        let attack : Int
        let cardClass : String
        let collectible : Bool
        let cost : Int
        let dbfId : Int
        let faction : String
        let flavor : String
        let health : Int
        let id : String
        let mechanics : [String]
        let name : String
        let race : String
        let rarity : String
        let referencedTags : [String]
        let set : String
        let text : String
        let type : String

        enum CodingKeys: String, CodingKey {
                //case cardID = "cardID"
                case artist = "artist"
                case attack = "attack"
                case cardClass = "cardClass"
                case collectible = "collectible"
                case cost = "cost"
                case dbfId = "dbfId"
                case faction = "faction"
                case flavor = "flavor"
                case health = "health"
                case id = "id"
                case mechanics = "mechanics"
                case name = "name"
                case race = "race"
                case rarity = "rarity"
                case referencedTags = "referencedTags"
                case set = "set"
                case text = "text"
                case type = "type"
        }
    
    init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            //cardID = try values.decodeIfPresent(UUID.self, forKey: .cardID) ??
            artist = try values.decodeIfPresent(String.self, forKey: .artist) ?? ""
            attack = try values.decodeIfPresent(Int.self, forKey: .attack) ?? 0
            cardClass = try values.decodeIfPresent(String.self, forKey: .cardClass) ?? ""
            collectible = try values.decodeIfPresent(Bool.self, forKey: .collectible) ?? false
            cost = try values.decodeIfPresent(Int.self, forKey: .cost) ?? 0
            dbfId = try values.decodeIfPresent(Int.self, forKey: .dbfId) ?? 0
            faction = try values.decodeIfPresent(String.self, forKey: .faction) ?? ""
            flavor = try values.decodeIfPresent(String.self, forKey: .flavor) ?? ""
            health = try values.decodeIfPresent(Int.self, forKey: .health) ?? 0
            id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
            mechanics = try values.decodeIfPresent([String].self, forKey: .mechanics) ?? [""]
            name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
            race = try values.decodeIfPresent(String.self, forKey: .race) ?? ""
            rarity = try values.decodeIfPresent(String.self, forKey: .rarity) ?? ""
            referencedTags = try values.decodeIfPresent([String].self, forKey: .referencedTags) ?? [""]
            set = try values.decodeIfPresent(String.self, forKey: .set) ?? ""
            text = try values.decodeIfPresent(String.self, forKey: .text) ?? ""
            type = try values.decodeIfPresent(String.self, forKey: .type) ?? ""
    }

    var cardImageURL: URL {
        let urlString = "https://art.hearthstonejson.com/v1/256x/\(id).jpg"
        return URL(string: urlString)!
    }
}


