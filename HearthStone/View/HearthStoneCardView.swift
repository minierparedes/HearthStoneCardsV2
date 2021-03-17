//
//  HearthStoneCardView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI

struct HearthStoneCardView: View {
    @EnvironmentObject var hearthStoneVM: HearthStoneViewModel
    var card: Card
    var animation: Namespace.ID
    
    var body: some View {
        VStack {
            Text("\(card.cost)")
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.85))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 10)
                .matchedGeometryEffect(id: "Cost-\(card.id)", in: animation)
            Image(systemName: "photo")
            HStack {
                Text(card.name)//populate items with data model each element
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 250, alignment: .leading)
                    .padding()
                    .matchedGeometryEffect(id: "Name-\(card.id)", in: animation)
                Spacer(minLength: 0)
            }
            Text(card.text)
                .foregroundColor(Color.white.opacity(0.85))
            
            Spacer(minLength: 0)
            
            HStack {
                Spacer(minLength: 0)
                Text("\(card.health)")
                    .foregroundColor(Color.white.opacity(0.85))
               
            }.padding(30)
           
            Text("\(card.attack)")
                .foregroundColor(Color.white.opacity(0.85))
            Text("\(card.health)")
                .foregroundColor(Color.white.opacity(0.85))
                
            
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: hearthStoneVM.backgroundColor(forType: card.type), startPoint: .top, endPoint: .bottom).cornerRadius(25).matchedGeometryEffect(id: "bgColor-\(card.id)", in: animation))
        .onTapGesture {
            withAnimation(.spring()) {
                hearthStoneVM.selectedCard = card
                hearthStoneVM.showCard.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeIn) {
                        hearthStoneVM.showContent = true
                    }
                }
            }
        }
    }
}

struct HearthStoneCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
