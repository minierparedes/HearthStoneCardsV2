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

    func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "HERO_POWER": return .systemGray6
        case "MINION": return .systemGreen
        case "SPELL": return .systemOrange
        case "WEAPON": return .systemGray
        case "ENCHANTMENT": return .systemPurple
        default: return .systemTeal
                
        }
    }
}
