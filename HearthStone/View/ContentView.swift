//
//  ContentView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var hsCarouselLVM = HearthStoneCarouselViewModel()
    @StateObject var hsCarouselLVM = HearthStoneCarouselViewModel()
    @State var items = Array(repeating: GridItem(spacing: 15), count: 15)
    var body: some View {
//       HearthStoneHomeView()
//        .environmentObject(homeModel)
        ScrollView {
            LazyVGrid(columns: items, spacing: 15) {
                ForEach(hsCarouselLVM.hsCards, id: \.id) { card in
                    HearthStoneCardView(hearthStoneCard: card, items: $items)
                    
                }
            }
        }
        
        Text("hello world")
        Button {
            hsCarouselLVM.getJSON()
        } label: {
            Text("Fetch Data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
