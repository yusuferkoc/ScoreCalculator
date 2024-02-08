//
//  SonucView.swift
//  Score Calculator
//
//  Created by Yusuf Erkoç on 8.02.2024.
//

import SwiftUI



struct SonucView: View {
    
    let  sonuc2022:Double
    let  sonuc2023:Double
    
    let  sonucEb2022:Double
    let  sonucEb2023:Double
    
    let  sonucOABT2022:Double?
    let  sonucOABT2023:Double?
    
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List {
                    Section {
                        Text("2023  P3 (Memur):\(sonuc2023,specifier: "%.3f")")
                        Text("2023  P10 (Memur):\(sonucEb2023,specifier: "%.3f")")
                        if sonucOABT2023 != nil {
                            Text("2023  P121 (Alan):\(sonucOABT2023 ?? 0,specifier: "%.3f")")
                        }
                    } header: {
                        Text("2023 KPSS")
                            .bold()
                            .foregroundStyle(.main)
                    }
                    
                    Section {
                        Text("2022  P3 (Memur):\(sonuc2022,specifier: "%.3f")")
                        Text("2022  P10 (Memur):\(sonucEb2022,specifier: "%.3f")")
                        if sonucOABT2022 != nil {
                            Text("2022  P121 (Alan):\(sonucOABT2022 ?? 0,specifier: "%.3f")")
                        }
                        
                    } header: {
                        Text("2022 KPSS")
                            .bold()
                            .foregroundStyle(.main)
                    }
                }
                
            }.navigationTitle("Sonuç")
                .toolbar {
                    ToolbarItem {
                        Button("Kapat", systemImage: "xmark") {
                            dismiss()
                        }
                    }
                } 
        }
    }
}
#Preview {
    SonucView(sonuc2022: 0, sonuc2023: 0, sonucEb2022: 0, sonucEb2023: 0, sonucOABT2022: 0, sonucOABT2023: 0)
}
