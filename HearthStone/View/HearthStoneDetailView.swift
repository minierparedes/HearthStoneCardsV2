////
////  HearthStoneDetailView.swift
////  HearthStone
////
////  Created by ethancr0wn on 2021/03/16.
////
//
//import SwiftUI
//
//struct HearthStoneDetailView: View {
//    @EnvironmentObject var hsCarouselLVM: HearthStoneCarouselViewModel
//    var animation: Namespace.ID
//    var body: some View {
//        VStack {
//            hsCarouselLVM.selectedCard.cardColor
//                .cornerRadius(25)
//                .matchedGeometryEffect(id: "bgColor-\(hsCarouselLVM.selectedCard.id)", in: animation)
//                .ignoresSafeArea(.all, edges: .bottom)
//        }
//    }
//}
//
//struct HearthStoneDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
