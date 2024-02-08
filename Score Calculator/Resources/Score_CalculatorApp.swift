//
//  Score_CalculatorApp.swift
//  Score Calculator
//
//  Created by Yusuf Erkoç on 3.02.2024.
//

import SwiftUI

@main
struct Score_CalculatorApp: App {
    
    init(){
        let appearanceNav = UINavigationBarAppearance()
        appearanceNav.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearanceNav
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceNav
        
        let appearanceTab = UITabBarAppearance()
        appearanceTab.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = appearanceTab
        UITabBar.appearance().scrollEdgeAppearance = appearanceTab
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
