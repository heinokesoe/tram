//
//  QandAView.swift
//  tram
//
//  Created by God on 17/2/24.
//

import SwiftUI

struct Bookmark: Identifiable {
    let id = UUID()
    let text: String
    var items: [Bookmark]?

    static let a1 = Bookmark(text: "It usually starts running at 8:30 a.m.")
    static let a2 = Bookmark(text: "It normally stops at 4:30 p.m.")
    static let a3 = Bookmark(text: "info@freaks.dev")
    static let a4 = Bookmark(text: "There are 3 tram stops. IT Building, 7/11 and Queen Sheba.")
    static let a5 = Bookmark(text: "5-10 mins (Yes tram is slow).")
    static let a6 = Bookmark(text: "It depends on the AU authorities. We are trying.")

    static let q1 = Bookmark(text: "When does the tram start running?", items: [Bookmark.a1])
    static let q2 = Bookmark(text: "When does the tram stop working?", items: [Bookmark.a2])
    static let q3 = Bookmark(text: "How can I contact for suggestion of this app?", items: [Bookmark.a3])
    static let q4 = Bookmark(text: "How many tram stops are available in AU?", items: [Bookmark.a4])
    static let q5 = Bookmark(text: "How long does it take between two stops?", items: [Bookmark.a5])
    static let q6 = Bookmark(text: "Can we get more trams at peak hours?", items: [Bookmark.a6])

}

struct QandAView: View {
    @Binding var presentSideMenu: Bool
    let items: [Bookmark] = [.q1, .q2, .q3, .q4, .q5, .q6]
    
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
                Spacer().overlay(Text("Q & A"), alignment: .trailing)
                    .font(.system(size: 24, weight: .bold))
            }
            
            Spacer()
            List(items, children: \.items) { row in
                            Text(row.text)
                    }
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}
