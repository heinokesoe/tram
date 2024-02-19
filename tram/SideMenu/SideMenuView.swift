//
//  SideMenuView.swift
//  tram
//
//  Created by God on 17/2/24.
//

import SwiftUI

enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case sharelocation
    case campusmap
    case qanda
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .sharelocation:
            return "Share Your Location"
        case .campusmap:
            return "Campus Map"
        case .qanda:
            return "Q&A"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "home"
        case .sharelocation:
            return "location"
        case .campusmap:
            return "map"
        case .qanda:
            return "qa"
        }
    }
}

struct SideMenuView: View {
    
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        HStack {
            
            ZStack{
                Rectangle()
                    .fill(.white)
                    .frame(width: 270)
                    .shadow(color: .purple.opacity(0.1), radius: 5, x: 0, y: 3)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    
                    ForEach(SideMenuRowType.allCases, id: \.self){ row in
                        RowView(isSelected: selectedSideMenuTab == row.rawValue, imageName: row.iconName, title: row.title) {
                            selectedSideMenuTab = row.rawValue
                            presentSideMenu.toggle()
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, 100)
                .frame(width: 270)
                .background(
                    Color.sidebar
                )
            }
            
            
            Spacer()
        }
        .background(.clear)
    }
    
    
    func RowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View{
        Button{
            action()
        } label: {
            VStack(alignment: .leading){
                HStack(spacing: 20){
                    Rectangle()
                        .fill(isSelected ? .purple : .sidebar)
                        .frame(width: 5)
                    
                    ZStack{
                        Image(imageName)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.text)
                            .frame(width: 26, height: 26)
                    }
                    .frame(width: 30, height: 30)
                    Text(title)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.text)
                    Spacer()
                }
            }
        }
        .frame(height: 50)
        .background(
            LinearGradient(colors: [isSelected ? .purple.opacity(0.5) : .sidebar, .sidebar], startPoint: .leading, endPoint: .trailing)
        )
    }
}
