//
//  OrtaView.swift
//  Score Calculator
//
//  Created by Yusuf Erkoç on 6.02.2024.
//

import SwiftUI

struct OrtaView: View {
    
    @State private var gkCorrect = 30
    @State private var gkFalse = 0
    
    @State private var gyCorrect = 30
    @State private var gyFalse = 0
    
    var body: some View {
        VStack{
            Form{
                Section{
                    Stepper("Doğru Sayısı:")
                }
            }
        }
}

#Preview {
    OrtaView()
}
