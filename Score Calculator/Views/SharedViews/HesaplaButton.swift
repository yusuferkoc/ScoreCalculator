//
//  HesaplaButton.swift
//  Score Calculator
//
//  Created by Yusuf Erkoç on 7.02.2024.
//

import SwiftUI

struct HesaplaButton: View {
    let title:String
    let action: () ->Void
    var body: some View {
        Button {
            action()
        } label: {
            Label(title,systemImage: "f.cursive")
                .font(.title)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
        } .buttonStyle(.borderedProminent)
            .tint(.main)
    }
}

#Preview {
    HesaplaButton(title: "Hesapla", action: {
        print("sw")
    })
}
