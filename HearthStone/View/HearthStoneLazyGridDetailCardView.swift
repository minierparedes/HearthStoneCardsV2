//
//  HearthStoneLazyGridDetailCardView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/22.
//

import SwiftUI

struct HearthStoneLazyGridDetailCardView: View {
    @EnvironmentObject var hearthStoneVM: HearthStoneViewModel
    @Binding var selectedCard: HearthStoneViewModel
    
    var animation: Namespace.ID
    var body: some View {
        VStack {
            HStack {
                
                Button(action: {
                    //close view
                    withAnimation(.spring()){hearthStoneVM.showCard.toggle()}
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                }
                
                Spacer()
            }
            
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Spacer()
        }
    }
}

struct HearthStoneLazyGridDetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
