//
//  ShareLocationView.swift
//  tram
//
//  Created by God on 17/2/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct ShareLocationView: View {
    @Binding var presentSideMenu: Bool
    let locationManager = CLLocationManager()
    @State var region = MKCoordinateRegion(
        center: .init(latitude: 13.612215,longitude: 100.836559),
        span: .init(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
    
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
                Spacer().overlay(Text("Share Location"), alignment: .trailing)
                    .font(.system(size: 24, weight: .bold))
            }
            
            Spacer()
            VStack {
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        locationManager.requestWhenInUseAuthorization()
                    }
            }
            ShareLink(item: URL(string: "https://www.google.com/maps/place/13%C2%B036'44.2%22N+100%C2%B050'11.8%22E/@13.6122893,100.8359753,19z/data=!3m1!4b1!4m4!3m3!8m2!3d13.612288!4d100.836619?entry=ttu")!) {
                Label("Share your location", systemImage: "square.and.arrow.up")
            }.padding(.vertical, 60)
                .labelStyle(.titleAndIcon)
                .imageScale(.large)
        }.padding(.horizontal, 24)
    }
}
