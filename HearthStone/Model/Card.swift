//
//  Card.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI


struct Card: Identifiable {
    var id = UUID().uuidString
    var cardColor: Color
    var offSet: CGFloat = 0
    var title: String?
}
