//
//  HearthStoneHomeView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI

struct HearthStoneHomeView: View {
    @EnvironmentObject var model: HearthStoneCarouselViewModel
    var body: some View {
        VStack{
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.gray)
                })
                Text("HearthStone Cards")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.leading)
                
                Spacer()
            }
            .padding()
            
            //Carousel
            ZStack{
                
            }
            Spacer()
        }
    }
}

struct HearthStoneHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
