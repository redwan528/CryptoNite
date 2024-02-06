//
//  HomeView.swift
//  CryptoNite
//
//  Created by Redwan Khan on 1/10/24.
//

import SwiftUI

var dev: DeveloperPreview {
    return DeveloperPreview.instance
}

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    
    
    var body: some View {
        ZStack {
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            //content layer
            VStack {
                homeHeader
                
                HStack {
                    Text("Coin")
                    Text("Holdings")
                    Text("Price")
                }
                
                if !showPortfolio {allCoinsList.transition(.move(edge: .leading))}
   
                if showPortfolio{portfolioCoinsList.transition(.move(edge: .leading))}
                
                Spacer(minLength: 0)
            }
        }
    }
}


#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }.environmentObject(dev.homeVM)
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
            //FIXME: rid animation
              
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .animation(.none)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        } .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
//                    CoinRowsView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: false)
            ForEach(vm.allCoins) { coin in
                CoinRowsView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                
            }
        }
        .listStyle(PlainListStyle())
    }
    
    
    private var portfolioCoinsList: some View {
        List {
//                    CoinRowsView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: false)
            ForEach(vm.allCoins) { coin in
                CoinRowsView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                
            }
        }
        .listStyle(PlainListStyle())
    }
}
