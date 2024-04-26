//
//  HomeViewModel.swift
//  CryptoNite
//
//  Created by Redwan Khan on 1/22/24.
//

import Foundation
import Combine
class HomeViewModel: ObservableObject { //conforming to observable object so that we can observe it from our view
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService() //this calls the CoinDataService init
//    init(allCoins: [CoinModel], portfolioCoins: [CoinModel]) {
//        self.allCoins = allCoins
//        self.portfolioCoins = portfolioCoins
//    }
    private var cancellables = Set<AnyCancellable>()
    
    //since we havent downloaded any data from internet yet, for now lets create init with one fake coin in both arrays, simulating like we're downloading from internet
    init(){
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            self.allCoins.append(DeveloperPreview.instance.coin)
//            self.portfolioCoins.append(DeveloperPreview.instance.coin)
//        }
        addSubscribers()
    }
    
    
    func addSubscribers() {
        dataService.$allCoins // when coinservicedata all coins gets published, this gets notifed
            .sink { (returnedCoins) in
                self.allCoins = returnedCoins
            }.store(in: &cancellables)
    }
}
