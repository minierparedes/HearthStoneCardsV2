//
//  HearthStoneCarouselViewModel.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI

class HearthStoneCarouselViewModel: ObservableObject {
    
    @Published var hsCards: [HearthStoneCard] = []
    @Published var offSet: CGFloat = 0
    @Published var swipedCard = 0
    @Published private var cardSearch: String = ""
    @Published var cardColor: Color = .purple
    
    func getJSON() {
        let apiService = APIService.shared
        apiService.getJSON(urlString: "https://api.hearthstonejson.com/v1/74257/enUS/cards.json") { (result: Result<[HearthStoneCard], APIService.APIError>) in
            switch result {
            case .success(let hearthStoneCardData):
                DispatchQueue.main.async {
                    self.hsCards = hearthStoneCardData
                    for card in hearthStoneCardData {
                        print(card.id)
                    }
                }
            case .failure(let apiError):
                switch apiError {
                case .error(let errorString):
                    print(errorString)
                }
            }
        }
    }
    
    
//    @Published var hearthStoneCarouselViewModelCards = [
//        Card(cardColor: Color.blue, title: "HearthStoneCard.name"),
//        Card(cardColor: Color.purple, title: "HearthStoneCard.name"),
//        Card(cardColor: Color.pink, title: "HearthStoneCard.name"),
//        Card(cardColor: Color.yellow, title: "HearthStoneCard.name"),
//        Card(cardColor: Color.orange, title: "HearthStoneCard.name")
//    ]

//    func cardColor(forType type: String) -> UIColor {
//        switch type {
//        case "hero": return .systemGray6
//        case "minion": return .systemGreen
//        case "spell": return .systemOrange
//        case "weapon": return .systemGray
//        default: return .systemPurple
//                
//        }
//    }
}
