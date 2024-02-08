//
//  MainView.swift
//  Score Calculator
//
//  Created by Yusuf Erkoç on 4.02.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List{
                    Section {
                        NavigationLink(destination:OrtaogretimView()) {
                            HStack{
                                Image(systemName: "1.circle")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                    .foregroundStyle(.main)
                                
                                Text("Orta öğretim")
                                    .badge(
                                    Text("P94")
                                        .italic()
                                    )
                            }
                        }
                        NavigationLink(destination:OnlisansView()) {
                            HStack{
                                Image(systemName: "2.circle")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                    .foregroundStyle(.main)
                                
                                Text("Önlisans")
                                    .badge(
                                    Text("P93")
                                        .italic()
                                    )
                            }
                        }
                        NavigationLink(destination:LisansView()) {
                            HStack{
                                Image(systemName: "3.circle")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                    .foregroundStyle(.main)
                                
                                Text("Lisans (B grubu)")
                                    .badge(
                                    Text("P3")
                                        .italic()
                                    )
                            }
                        }
                        NavigationLink(destination:EgitimView()) {
                            HStack{
                                Image(systemName: "4.circle")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                    .foregroundStyle(.main)
                                
                                Text("Eğitim Bilimleri")
                                    .badge(
                                    Text("P10")
                                        .italic()
                                    )
                            }
                        }
                        NavigationLink(destination:OabtView()) {
                            HStack{
                                Image(systemName: "5.circle")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                    .foregroundStyle(.main)
                                
                                Text("ÖABT")
                                    .badge(
                                    Text("P121")
                                        .italic()
                                    )
                            }
                        }
                    }header: {
                        Text("Bölüm seçiniz")
                    }
                }
            }
            .navigationTitle("Sınav Puan Hesaplama")
        }
    }
}

#Preview {
    MainView()
}
