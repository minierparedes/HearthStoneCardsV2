//
//  HearthStoneDetailView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/16.
//

import SwiftUI

struct HearthStoneDetailView: View {
    @EnvironmentObject var hearthStoneVM: HearthStoneViewModel
    var animation: Namespace.ID
    var body: some View {
        ZStack {
            VStack {
                
                Text("\(hearthStoneVM.selectedCard.cost)")
                    .font(.caption)
                    .foregroundColor(Color.white.opacity(0.85))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top, 10)
                    .matchedGeometryEffect(id: "Cost-\(hearthStoneVM.selectedCard.cardID)", in: animation)
                HStack {
                    Text(hearthStoneVM.selectedCard.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 250, alignment: .leading)
                        .padding()
                        .matchedGeometryEffect(id: "Name-\(hearthStoneVM.selectedCard.cardID)", in: animation)
                    
                    Spacer(minLength: 0)
                }
                
                
                //Detail text content / showing content some delay for better anitmation
                if hearthStoneVM.showContent {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .animation(.easeIn)
                }
                //hearthStoneVM.selectedCard.cardColor
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: hearthStoneVM.backgroundColor(forType: hearthStoneVM.selectedCard.type), startPoint: .top, endPoint: .bottom)
                            .cornerRadius(25)
                            .matchedGeometryEffect(id: "bgColor-\(hearthStoneVM.selectedCard.cardID)", in: animation)
                            .ignoresSafeArea(.all, edges: .bottom))
            .onTapGesture {
                withAnimation(.spring()) {
                    hearthStoneVM.showCard.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.easeIn) {
                            hearthStoneVM.showContent = false
                        }
                    }
                }
            }
        }
    }
}

struct HearthStoneDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
