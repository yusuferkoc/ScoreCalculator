//
//  EgitimView.swift
//  Score Calculator
//
//  Created by Yusuf Erkoç on 6.02.2024.
//

import SwiftUI


struct EgitimView: View {
    @State private var gkCorrect:Double = 30
    @State private var gkFalse:Double = 0

    @State private var gyCorrect:Double = 30
    @State private var gyFalse:Double = 0
    
    @State private var ebCorrect:Double = 40
    @State private var ebFalse:Double = 0
    
    @State private var sonuc2022:Double = 0
    @State private var sonuc2023:Double = 0
    
    @State private var sonucEb2022:Double = 0
    @State private var sonucEb2023:Double = 0

    @State private var isShowingSheet = false

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
                Section{
                    Stepper("Doğru Sayısı:\(ebCorrect,specifier: "%.0f")",value:$ebCorrect, in:0...(80 - ebFalse))
                        .sensoryFeedback(.selection, trigger: ebCorrect)
                        .bold()
                    Stepper("Doğru Sayısı:\(ebFalse,specifier: "%.0f")",value:$ebFalse, in:0...(80 - ebCorrect))
                        .sensoryFeedback(.selection, trigger: ebFalse)
                        .bold()
                    
                    HesaplaButton(title: "Hesapla") {
                                
                                    let gkNet = gkCorrect - (gkFalse/4)
                                    let gyNet = gyCorrect - (gyFalse/4)
                                    let ebNet = ebCorrect - (ebFalse/4)

                                
                                
                                    sonucEb2022 = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                                    sonuc2022   = 48.616 + gyNet * 0.4756 + gkNet * 0.4192
                                    
                                    sonucEb2023 = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.34145
                                    sonuc2023   = 51.209 + gyNet * 0.4537 + gkNet * 0.418
                      
                                    isShowingSheet.toggle()
                                    
                                
                            }.sheet(isPresented: $isShowingSheet) {
                                SonucView(sonuc2022: sonuc2022, sonuc2023: sonuc2023, sonucEb2022: sonucEb2022, sonucEb2023: sonucEb2023, sonucOABT2022: nil, sonucOABT2023: nil)
                            }
                            

                }header: {
                    Text("Eğitim Bilimleri")
                        .textCase(.none)
                }
            }
        }
        .navigationTitle("Eğitim Bilimleri")
    }
    
}
#Preview {
    EgitimView()
}
