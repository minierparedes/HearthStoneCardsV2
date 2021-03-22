//
//  HearthStoneHomeView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI

//width
var width = UIScreen.main.bounds.width

struct HearthStoneHomeView: View {
    
    @EnvironmentObject var hearthStoneVM: HearthStoneViewModel
    @Namespace var animation
    @State var selected = categoryTabs[0]
    @Namespace var tabAnimation
    @State var selectedCard: Card = featuredCards[0]
    
    var body: some View {
        
        VStack {
            Spacer()
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text("HearthStone")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.yellow)
                    }
                    .padding(.horizontal)
                    Spacer(minLength: 0)
                }
            }
            
            HStack(spacing: 0) {
                ForEach(categoryTabs, id: \.self) {tab in
                    //Tab button
                    TabButtonView(title: tab, selected: $selected, tabAnimation: tabAnimation)
                    
                    //even spacing
                    
                    if categoryTabs.last != tab{Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)}
                }
            }
            .padding()
            .padding(.top, 5)
            
            ScrollView {
                
                VStack {
                    ZStack {
                        VStack {
                            HStack {
                                Button(action: {
                                    hearthStoneVM.getJSON()
                                }, label: {
                                    Image(systemName: "xmark")
                                        .font(.title2)
                                        .foregroundColor(.gray)
                                })
                                Text("Featured")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding(.leading)
                                
                                Spacer()
                            }
                            .padding()
                            
                            //Carousel
                            ZStack {
                                ForEach(hearthStoneVM.featuredCards.indices.prefix(11).reversed(), id: \.self) {index in
                                    HStack {
                                        HearthStoneCardView(card: hearthStoneVM.featuredCards[index], animation: animation)
                                            .frame(width: getCardWidth(index: index), height:getCardHeight(index: index))
                                            .offset(x: getCardOffSet(index: index))
                                            .rotationEffect(.init(degrees: getCardRotation(index: index)))
                                        
                                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                                    }
                                    .frame(height: 460)
                                    .contentShape(Rectangle())
                                    .offset(x: hearthStoneVM.featuredCards[index].offSet)
                                    .gesture(DragGesture(minimumDistance: 0).onChanged({(value) in
                                        dragGestureOnChange(value: value, index: index)
                                    }).onEnded({(value) in
                                        dragGestureOnEnd(value: value, index: index)
                                    }))
                                    
                                }
                            }
                            .padding(.top, 25)
                            .padding(.horizontal, 30)//based on the func getCardWeight() boxWidth
                            
                            Button(action: ResetViews, label: {
                                Image(systemName: "arrow.left")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 90, height: 35)
                                    .background(Color.purple)
                                    .clipShape(Rectangle())
                                    .cornerRadius(8)
                                    .shadow(radius: 6)
                                
                            })
                            .padding(.top, 35)
                            .padding(.bottom, 40)
                            Spacer()
                        }
                        
                        //DetailView
                        if hearthStoneVM.showCard {
                            HearthStoneDetailView(animation: animation)
                        }
                    }
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: -20), count: 2), spacing: 25) {

                        ForEach(hearthStoneVM.featuredCards) {card in
                            //Card View
                            HearthStoneLazyGridCardView(card: card, animation: animation)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedCard = card
                                        hearthStoneVM.showCard.toggle()
                                    }
                                }
                        }
                    }
                }
                
                
            }
            .opacity(hearthStoneVM.showCard ? 0 : 1)
            
            if hearthStoneVM.showCard {
                HearthStoneLazyGridDetailCardView(selectedCard: $selectedCard, animation: animation)
            }
            
            
            Spacer(minLength: 0)
        }
    }
    
    
    
    //Reset Views
    func ResetViews() {
        for index in hearthStoneVM.featuredCards.indices {
            withAnimation(.spring()) {
                hearthStoneVM.featuredCards[index].offSet = 0
                hearthStoneVM.swipedCard = 0
            }
        }
    }
    
    //get rotation when card is being swiped
    func getCardRotation(index: Int) -> Double {
        let boxWidth = Double(width / 3)
        let offSet = Double(hearthStoneVM.featuredCards[index].offSet)
        let angle: Double = 8
        return (offSet / boxWidth) * angle
    }
    
    func dragGestureOnChange(value: DragGesture.Value, index: Int) {
        //only left swipe
        if value.translation.width < 0 {
            hearthStoneVM.featuredCards[index].offSet = value.translation.width
        }
    }
    
    func dragGestureOnEnd(value: DragGesture.Value, index: Int) {
        withAnimation{
            if -value.translation.width > width / 3{
                hearthStoneVM.featuredCards[index].offSet = -width
                hearthStoneVM.swipedCard += 1
            } else {
                hearthStoneVM.featuredCards[index].offSet = 0
            }
        }
    }
    
    //func to get width & height for card
    func getCardHeight(index: Int) -> CGFloat {
        let height: CGFloat = 460
        //again first several(3) cards
        let cardHeight = index - hearthStoneVM.swipedCard <= 2 ? CGFloat(index - hearthStoneVM.swipedCard) * 35 : 70
        return height - cardHeight
    }
    
    func getCardWidth(index: Int) -> CGFloat {
        let boxWidth = UIScreen.main.bounds.width - 60 - 60
        //for first several(11) cards
        //let cardWidth = index <= 2 ? CGFloat(index) * 30 : 60
        return boxWidth
    }
    //func to get OffSet
    func getCardOffSet(index: Int) -> CGFloat {
        return index - hearthStoneVM.swipedCard <= 2 ? CGFloat(index - hearthStoneVM.swipedCard) * 30 : 60
    }
}

var categoryTabs = ["Featured", "Heros", "Cards", "Card Sets"]


struct HearthStoneHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
