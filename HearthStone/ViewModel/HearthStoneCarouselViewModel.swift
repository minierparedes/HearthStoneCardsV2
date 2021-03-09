//
//  HearthStoneCarouselViewModel.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI

class HearthStoneCarouselViewModel: ObservableObject {
   
    @Published var hearthStoneCarouselViewModelCards = [
        Card(cardColor: Color.blue, title: "HearthStoneCard.name"),
        Card(cardColor: Color.purple, title: "HearthStoneCard.name"),
        Card(cardColor: Color.pink, title: "HearthStoneCard.name"),
        Card(cardColor: Color.yellow, title: "HearthStoneCard.name"),
        Card(cardColor: Color.orange, title: "HearthStoneCard.name")
    ]
    @Published var swipedCard = 0
}
