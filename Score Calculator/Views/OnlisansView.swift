//
//  OnlisansView.swift
//  Score Calculator
//
//  Created by Yusuf Erkoç on 6.02.2024.
//

import SwiftUI

struct OnlisansView: View {
    @State private var gkCorrect:Double = 30
    @State private var gkFalse:Double = 27

    @State private var gyCorrect:Double = 30
    @State private var gyFalse:Double = 23
    
    @State private var sonuc:Double = 0

    var body: some View {
        VStack {
            Form{
                Section{
                    Stepper("Doğru Sayısı:\(gkCorrect,specifier: "%.0f")",value:$gkCorrect, in:1...(60-gkFalse))
                        .sensoryFeedback(.selection, trigger: gkCorrect)
                        .bold()
                    
                    Stepper("Doğru Sayısı:\(gkFalse,specifier: "%.0f")",value:$gkFalse, in:1...(60-gkCorrect))
                        .sensoryFeedback(.selection, trigger: gkFalse)
                        .bold()
                } header: {
                    Text("Genel Kültür")
                        .textCase(.none)
                }
                Section{
                    Stepper("Doğru Sayısı:\(gyCorrect,specifier: "%.0f")",value:$gyCorrect, in:0...(60 - gyFalse))
                        .sensoryFeedback(.selection, trigger: gyCorrect)
                        .bold()
                    Stepper("Doğru Sayısı:\(gyFalse,specifier: "%.0f")",value:$gyFalse, in:0...(60 - gyCorrect))
                        .sensoryFeedback(.selection, trigger: gyFalse)
                        .bold()

                }header: {
                    Text("Genel Yetenek")
                        .textCase(.none)
                }
                Section {
                    Text("KPSS Puanı:\(sonuc,specifier: "%.3f")")
                        .bold()
                    
                    HesaplaButton(title: "Hesapla") {
                        
                            let gkNet = gkCorrect - (gkFalse/4)
                            let gyNet = gyCorrect - (gyFalse/4)
                        
                        withAnimation {
                            sonuc = 55.816 + gyNet * 0.43 + gkNet * 0.397
                        }
                    }
                    
                }header: {
                    Text("Sonuç")
                        .textCase(.none)
                }
            }
        }
        .navigationTitle("Önlisans")
    }
    
}

#Preview {
    OnlisansView()
}
