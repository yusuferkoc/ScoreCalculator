//
//  ResultView.swift
//  Score Calculator
//
//  Created by Yusuf Erkoç on 4.02.2024.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List(0 ..< 50) { item in
                    Text("Hesaplama \(item)")
                }
            }
            .navigationTitle("Geçmiş")
        }
    }
}

#Preview {
    ResultView()
}
