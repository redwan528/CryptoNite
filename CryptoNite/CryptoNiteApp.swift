//
//  CryptoNiteApp.swift
//  CryptoNite
//
//  Created by Redwan Khan on 1/10/24.
//

import SwiftUI

@main
struct CryptoNiteApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }.environmentObject(vm)
        }
    }
}
