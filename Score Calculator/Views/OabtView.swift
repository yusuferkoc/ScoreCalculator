//
//  OabtView.swift
//  Score Calculator
//
//  Created by Yusuf Erkoç on 6.02.2024.
//

import SwiftUI

struct OabtView: View {
    @State private var gkCorrect:Double = 30
    @State private var gkFalse:Double = 0

    @State private var gyCorrect:Double = 30
    @State private var gyFalse:Double = 0
    
    @State private var ebCorrect:Double = 40
    @State private var ebFalse:Double = 0
    
    @State private var oabtCorrect:Double = 40
    @State private var oabtFalse:Double = 0
    
    @State private var sonuc2022:Double = 0
    @State private var sonuc2023:Double = 0
    
    @State private var sonucEb2022:Double = 0
    @State private var sonucEb2023:Double = 0
    
    @State private var sonucOABT2022:Double = 0
    @State private var sonucOABT2023:Double = 0
   
    @State private var oabtKatsayi = 0.4334
    @State private var oabtPuan = 43.805

    
    @State private var selectedOption = 0
        let options = [
            (0.4334,43.805, "Beden Eğitimi"),
            (0.3666,41.071, "Biyoloji"),
            (0.4301,39.060, "Coğrafya"),
            (0.4052,34.908, "Din Kültürü"),
            (0.3679,42.156, "Edebiyat"),
            (0.5388,39.313, "Fen Bilgisi"),
            (0.3817,41.604, "Fizik"),
            (0.5225,36.309, "İlköğretim Matematik"),
            (0.3883,37.962, "İmam Hatip Meslek Dersleri Ö."),
            (0.3791,40.920, "İngilizce"),
            (0.4542,42.157, "Kimya"),
            (0.4247,41.759, "Lise Matematik"),
            (0.4944,33.292, "Okul Öncesi"),
            (0.4883,29.014, "Rehberlik "),
            (0.6184,33.598, "Sınıf Öğretmenliği"),
            (0.6142,34.101, "Sosyal Bilgiler"),
            (0.3521,41.418, "Tarih"),
            (0.4565,34.329, "Türkçe")
        ]
    
    @State private var isShowingSheet = false


    var body: some View {
        VStack {
            Form{
                Section{
                    
                    Stepper(value:$gkCorrect, in:1...(60-gkFalse)){
                        Label("Doğru Sayısı:\(gkCorrect,specifier: "%.0f")",systemImage: "checkmark")
                    }
                        .sensoryFeedback(.selection, trigger: gkCorrect)
                        .bold()
                    
                    Stepper(value:$gkFalse, in:1...(60-gkCorrect)){
                        Label("Doğru Sayısı:\(gkFalse,specifier: "%.0f")",systemImage: "xmark")
                            
                    }
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

                }header: {
                    Text("Eğitim Bilimleri")
                        .textCase(.none)
                }
                Section{
                    Picker ("Bölüm Seçiniz",selection: $selectedOption){
                        ForEach(0..<options.count,id:\.self){ index in
                            HStack {
                                Image(systemName: "person.circle.fill")
                                Text(options[index].2)
                            }
                        }
                    }
                    .onChange(of: selectedOption) {
                        oabtKatsayi = options[selectedOption].0
                        oabtPuan = options[selectedOption].1
                        
                    }
                    
                    Stepper("Doğru Sayısı:\(oabtCorrect,specifier: "%.0f")",value:$oabtCorrect, in:0...(75 - oabtFalse))
                        .sensoryFeedback(.selection, trigger: oabtCorrect)
                        .bold()
                    Stepper("Doğru Sayısı:\(oabtFalse,specifier: "%.0f")",value:$oabtFalse, in:0...(75 - oabtCorrect))
                        .sensoryFeedback(.selection, trigger: oabtFalse)
                        .bold()
                    HesaplaButton(title: "Hesapla") {
                        
                            let gkNet = gkCorrect - (gkFalse/4)
                            let gyNet = gyCorrect - (gyFalse/4)
                            let ebNet = ebCorrect - (ebFalse/4)
                            let oabtNet = oabtCorrect - (oabtFalse/4)
                        
                            sonuc2022  = 48.616 + gyNet * 0.4756 + gkNet * 0.4192
                            sonucEb2022   = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                            sonucOABT2022 = oabtPuan + gyNet * 0.1720 + gkNet * 0.1515 + ebNet * 0.1498 + oabtNet * oabtKatsayi
                            sonuc2023 = 51.209 + gyNet * 0.537 + gkNet * 0.418
                            sonucEb2023   = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145
                        isShowingSheet.toggle()
                        
                      
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        SonucView(sonuc2022: sonuc2022, sonuc2023: sonuc2023, sonucEb2022: sonucEb2022, sonucEb2023: sonucEb2023, sonucOABT2022: sonucOABT2022, sonucOABT2023: nil)
                    }
                    


                }header: {
                    Text("ÖABT")
                        .textCase(.none)
                }
            
            }
        }
        .navigationTitle("ÖABT")
    }
    
}
#Preview {
    OabtView()
}
