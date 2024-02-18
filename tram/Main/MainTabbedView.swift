//
//  MainTabbedView.swift
//  tram
//
//  Created by God on 17/2/24.
//

import SwiftUI

struct MainTabbedView: View {
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    
    var body: some View {
        ZStack{
            
            TabView(selection: $selectedSideMenuTab) {
                HomeView(presentSideMenu: $presentSideMenu)
                    .tag(0)
                ShareLocationView(presentSideMenu: $presentSideMenu)
                    .tag(1)
                CampusMapView(presentSideMenu: $presentSideMenu)
                    .tag(2)
                QandAView(presentSideMenu: $presentSideMenu)
                    .tag(3)
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}
