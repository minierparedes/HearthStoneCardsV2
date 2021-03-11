//
//  HearthStoneCardView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI

struct HearthStoneCardView: View {
    @EnvironmentObject var hsCarouselLVM: HearthStoneCarouselViewModel
    var hearthStoneCard: HearthStoneCard//COrrect
    //@Binding var items: [GridItem]
    
    var body: some View {
        VStack {
            Text(hearthStoneCard.name)
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.85))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 10)
            Text(hearthStoneCard.text)//populate items with data model each element
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 250, alignment: .leading)
                .padding()
            
            
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hsCarouselLVM.backgroundColor(forType: hearthStoneCard.type)))
        .cornerRadius(18)
    }
}

struct HearthStoneCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
