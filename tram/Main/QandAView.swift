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

    static let a1 = Bookmark(text: "answer1")
    static let a2 = Bookmark(text: "answer2")
    static let a3 = Bookmark(text: "answer3")
    static let a4 = Bookmark(text: "answer4")
    static let a5 = Bookmark(text: "answer5")
    static let a6 = Bookmark(text: "answer6")

    static let q1 = Bookmark(text: "question1", items: [Bookmark.a1])
    static let q2 = Bookmark(text: "question2", items: [Bookmark.a2])
    static let q3 = Bookmark(text: "question3", items: [Bookmark.a3])
    static let q4 = Bookmark(text: "question4", items: [Bookmark.a4])
    static let q5 = Bookmark(text: "question5", items: [Bookmark.a5])
    static let q6 = Bookmark(text: "question6", items: [Bookmark.a6])

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
