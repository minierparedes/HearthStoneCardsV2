//
//  ContentView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI

struct ContentView: View {
    @StateObject var hsHomeViewModel = HearthStoneViewModel()
    var body: some View {
       HearthStoneHomeView()
        //using it as an environment object
        .environmentObject(hsHomeViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
