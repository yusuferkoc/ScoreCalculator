//
//  ContentView.swift
//  Score Calculator
//
//  Created by Yusuf Erkoç on 3.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectionItem=0
    var body: some View {
        TabView(selection:$selectionItem){
            MainView()
                .tabItem {
                    Label("Başlangıç", systemImage: "house")
                        .environment(\.symbolVariants, selectionItem == 0 ? .fill : .none)
                }
                .tag(0)
            ResultView()
                .tabItem {
                    Label("Hesaplamalar", systemImage: "arrow.counterclockwise.circle")
                        .environment(\.symbolVariants, selectionItem == 0 ? .fill : .none)
                }
                .tag(1)
        }
        .tint(.pink)
    }
}

#Preview {
    ContentView()
}
