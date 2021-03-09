//
//  HearthStoneCardexView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI

struct HearthStoneCardexView: View {
    private let gridItems = [GridItem(.flexible())]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, content: {
                    ForEach(0..<15) { _ in
                        HearthStoneCardCellView()
                    }
                })
            }
        }
    }
}

struct HearthStoneCardexView_Previews: PreviewProvider {
    static var previews: some View {
        HearthStoneCardexView()
    }
}
