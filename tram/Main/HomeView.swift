//
//  HomeView.swift
//  tram
//
//  Created by God on 17/2/24.
//

import SwiftUI
import GIFImage

struct HomeView: View {
    @Binding var presentSideMenu: Bool
    @State var animate: Bool = true
    @State var loop: Bool = true
    let url = URL(string: "https://freaks.dev/tram.gif")!
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
                } label: {
                    Image("menu")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.text)
                        .frame(width: 32, height: 32)
                }
                Spacer().overlay(Text("Tram Tracker"), alignment: .trailing)
                    .font(.system(size: 24, weight: .bold))
                
            }
            
            Spacer()
            GIFImage(source: .remoteURL(url), animate: $animate, loop: $loop).frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .center)
        }
        .padding(.horizontal, 24)
    }
}
