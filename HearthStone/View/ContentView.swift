//
//  ContentView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI

struct ContentView: View {
    @State private var cardSearch: String = ""
    @StateObject var homeModel = HearthStoneCarouselViewModel()
    var body: some View {
       HearthStoneHomeView()
        .environmentObject(homeModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
