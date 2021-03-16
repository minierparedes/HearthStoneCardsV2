//
//  HearthStoneCardView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI

struct HearthStoneCardView: View {
    @EnvironmentObject var hsCarouselLVM: HearthStoneCarouselViewModel
    var card: HearthStoneCard
    
    var body: some View {
        VStack {
            Text(card.name)
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.85))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 10)
            Text(card.artist)//populate items with data model each element
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 250, alignment: .leading)
                .padding()
            
            
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: hsCarouselLVM.backgroundColor(forType: card.type), startPoint: .top, endPoint: .bottom))
        .cornerRadius(18)
    }
}

struct HearthStoneCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
