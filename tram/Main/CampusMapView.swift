//
//  CampusMapView.swift
//  tram
//
//  Created by God on 17/2/24.
//

import SwiftUI

struct CampusMapView: View {
    @Binding var presentSideMenu: Bool
    @State var scale = 1.0
        @State private var lastScale = 1.0
        private let minScale = 1.0
        private let maxScale = 5.0
        
        var magnification: some Gesture {
            MagnificationGesture()
                .onChanged { state in
                    adjustScale(from: state)
                }
                .onEnded { state in
                    withAnimation {
                        validateScaleLimits()
                    }
                    lastScale = 1.0
                }
        }
    func adjustScale(from state: MagnificationGesture.Value) {
        let delta = state / lastScale
        scale *= delta
        lastScale = state
    }
    
    func getMinimumScaleAllowed() -> CGFloat {
        return max(scale, minScale)
    }
    
    func getMaximumScaleAllowed() -> CGFloat {
        return min(scale, maxScale)
    }
    
    func validateScaleLimits() {
        scale = getMinimumScaleAllowed()
        scale = getMaximumScaleAllowed()
    }
    
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
                Spacer().overlay(Text("Campus Map"), alignment: .trailing)
                    .font(.system(size: 24, weight: .bold))
            }
            
            Spacer()
            Image("campus")
                .resizable()
                .ignoresSafeArea()
                .scaleEffect(scale)
                            .gesture(magnification)
            Spacer()
        }
        .padding(.horizontal, 24)
    }

}
