//
//  TabButtonView.swift
//  HearthStone
//
//  Created by ethancr0wn on 2021/03/18.
//

import SwiftUI

struct TabButtonView: View {
    var title: String
    @Binding var selected: String
    var animation: Namespace.ID
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()){selected = title}
            
        }) {
                Text(title)
                    .font(.system(size: 15))
                    .foregroundColor(selected == title ? .yellow : .black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, selected == title ? 20 : 0)
                    .background({
                        //Slider animation
                        ZStack {
                            if selected == title {
                                Color.purple
                                    .clipShape(Capsule())
                                    .matchedGeometryEffect(id: "Tab", in: animation)
                            }
                        }
                    })
            }
    }
}

struct TabButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
