//
//  HearthStoneLazyGridCardView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/19.
//

import SDWebImageSwiftUI
import SwiftUI

struct HearthStoneLazyGridCardView: View {
    @EnvironmentObject var hearthStoneVM: HearthStoneViewModel
    var card: Card
    var animation: Namespace.ID
    var body: some View {
        VStack {
            HStack {
                
                
                Text("\(card.cost)")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(10)
                Spacer(minLength: 0)
                
            }
            
            WebImage(url: URL(string: "https://art.hearthstonejson.com/v1/256x/\(card.id).jpg"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding(.top, 30)
                .padding(.bottom)
                .padding(.horizontal, 10)
            
            Text(card.name)
                .font(.title2)
                .foregroundColor(.black)
            
            HStack {
                Text("\(card.attack)")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
                Text("\(card.health)")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
            }.padding()
            
        }
//        .padding(.bottom)
        .background(LinearGradient(gradient: hearthStoneVM.backgroundColor(forType: card.type), startPoint: .top, endPoint: .bottom))
        .cornerRadius(15)
        .frame(width:180)
    }
}

struct HearthStoneLazyGridCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
