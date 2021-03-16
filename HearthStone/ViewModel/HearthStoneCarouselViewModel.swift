//
//  HearthStoneCarouselViewModel.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI

class HearthStoneCarouselViewModel: ObservableObject {
    
    @Published var hsCards: [HearthStoneCard] = []
    @Published var swipedCard = 0
    @Published private var cardSearch: String = ""
    @Published var cards: [Card] = []
    
    
    var count: Int {
        return hsCards.count
    }
    
    func position(of hsCard: HearthStoneCard) -> Int {
        
        return hsCards.firstIndex(where: {$0.id == hsCard.id}) ?? 0
    }
    
    func deckOffset(of hsCard: HearthStoneCard) -> CGFloat {
        let deckPosition = position(of: hsCard)
        let offset = deckPosition * -10
        return CGFloat(offset)
    }
    
    func gradientColors(forType type1: String, forType type2: String) -> LinearGradient {
       return LinearGradient(gradient: Gradient(colors: [Color("\(type1)"), Color("\(type2)")]), startPoint: .top, endPoint: .bottom)
    }

    func backgroundColor(forType type: String) -> Gradient {
        let deathKnightGradientColor = Gradient(colors: [Color.cardClassDeathKnightDark, Color.cardClassDeathKnightLight])
        let demonHunterGradientColor = Gradient(colors: [Color.cardClassDemonHunterDark, Color.cardClassDemonHunterLight])
        let druidGradientColor = Gradient(colors: [Color.cardClassDruidDark, Color.cardClassDruidLight])
        let hunterGradientColor = Gradient(colors: [Color.cardClassHunterDark, Color.cardClassHunterLight])
        let mageGradientColor = Gradient(colors: [Color.cardClassMageDark, Color.cardClassMageLight])
        let paladinGradientColor = Gradient(colors: [Color.cardClassPaladinDark, Color.cardClassPaladinLight])
        let priestGradientColor = Gradient(colors: [Color.cardClassPriestDark, Color.cardClassPriestLight])
        let rogueGradientColor = Gradient(colors: [Color.cardClassRogueDark, Color.cardClassRogueLight])
        let shamanGradientColor = Gradient(colors: [Color.cardClassShamanDark, Color.cardClassShamanLight])
        let warlockGradientColor = Gradient(colors: [Color.cardClassWarlockDark, Color.cardClassWarlockLight])
        let warriorGradientColor = Gradient(colors: [Color.cardClassWarriorDark, Color.cardClassWarriorLight])
        let neutralGradientColor = Gradient(colors: [Color.cardClassNeutralDark, Color.cardClassNeutralLight])
        
        switch type {
        case "DEATHKNIGHT": return deathKnightGradientColor
        case "DEMONHUNTER": return demonHunterGradientColor
        case "DRUID": return druidGradientColor
        case "HUNTER": return hunterGradientColor
        case "MAGE": return mageGradientColor
        case "PALADIN": return paladinGradientColor
        case "PRIEST": return priestGradientColor
        case "ROGUE": return rogueGradientColor
        case "SHAMAN": return shamanGradientColor
        case "WARLOCK": return warlockGradientColor
        case "WARRIOR": return warriorGradientColor
        default: return neutralGradientColor
                
        }
    }
    
    func getJSON() {
        let apiService = APIService.shared
        apiService.getJSON(urlString: "https://api.hearthstonejson.com/v1/74257/enUS/cards.json") { (result: Result<[HearthStoneCard], APIService.APIError>) in
            switch result {
            case .success(let hearthStoneCardData):
                DispatchQueue.main.async {
                    self.hsCards = hearthStoneCardData
                    for card in hearthStoneCardData.prefix(10000) {
                        if card.type == "HERO" {
                            self.cards.append(Card(name: card.name, artist: card.artist, img: card.cardImageURL, type: card.type))
                            print("Hero name: \(card.set) ", "card id: \(card.id)")
                        }
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
}


