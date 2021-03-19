//
//  Card.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI


struct Card:Identifiable, Equatable {
    var cardID = UUID().uuidString
    var offSet: CGFloat = 0
    var cardColor: Color
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
}
