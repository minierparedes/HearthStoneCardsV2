//
//  HearthStoneCardCellView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/09.
//

import SwiftUI

struct HearthStoneCardCellView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 68, height: 68)
                    .padding(.bottom)
                VStack(spacing: 10) {
                    
                    Text("Card Name")
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 26).fill(Color.white.opacity(0.25)))
                        .frame(width: 100, height: 26)
                        
                    Text("Description")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .overlay(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.25)))
                        .frame(width: 100, height: 50)
                        
                        
                      
                }
            }
        }
        .background(Color.purple)
        .cornerRadius(15)
        .shadow(color: .purple, radius: 6)
    }
}

struct HearthStoneCardCellView_Previews: PreviewProvider {
    static var previews: some View {
        HearthStoneCardCellView()
    }
}
