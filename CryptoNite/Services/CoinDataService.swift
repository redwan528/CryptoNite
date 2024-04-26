//
//  CoinDataService.swift
//  CryptoNite
//
//  Created by Redwan Khan on 4/25/24.
//

import Foundation
import Combine

class CoinDataService {
    
    
    @Published var allCoins: [CoinModel] = [] //using @Published makes it publishers which can have subscribers
    //var cancellables = Set<AnyCancellable>
    var coinSubscriptions: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    
    private func getCoins() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en")
        else {return}
        
        coinSubscriptions = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink (receiveCompletion: {(completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
                }, receiveValue: { [weak self] (returnedCoins) in
                    self?.allCoins = returnedCoins
                    self?.coinSubscriptions?.cancel()
                })
                // .store(in: &cancellables)
            }
        
    }
    
    
    
    
    
    

