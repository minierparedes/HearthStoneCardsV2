//
//  Card.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI


struct Card:Identifiable, Equatable {
    var id = UUID().uuidString
    var offSet: CGFloat = 0
    var name: String
    var artist: String
    var img: URL
    var type: String
}
