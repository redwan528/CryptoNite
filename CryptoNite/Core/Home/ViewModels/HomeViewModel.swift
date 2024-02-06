//
//  HomeViewModel.swift
//  CryptoNite
//
//  Created by Redwan Khan on 1/22/24.
//

import Foundation

class HomeViewModel: ObservableObject { //conforming to observable object so that we can observe it from our view
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
//    init(allCoins: [CoinModel], portfolioCoins: [CoinModel]) {
//        self.allCoins = allCoins
//        self.portfolioCoins = portfolioCoins
//    }
    
    //since we havent downloaded any data from internet yet, for now lets create init with one fake coin in both arrays, simulating like we're downloading from internet
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
