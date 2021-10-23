//
//  NewsStandViewModel.swift
//  NA-dxm8969-2
//
//  Created by Dominik Maric on 22.10.2021..
//

import SwiftUI
import Foundation
import Combine

class NewsStandViewModel: ObservableObject{
    
    @Published private(set) var newsStandData: [NewsStand] = []
    
    private let mockableUrl =
        "https://70o99.mocklab.io/newsstand"
    
    private var cancellable: Set<AnyCancellable> = []
    
    init() {
        retrieveData()
    }
    
    func retrieveData() {
        guard let url = URL(string: mockableUrl) else {
            fatalError("URL is not valid")
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { $0.data }
            .decode(type: [NewsStand].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { self.newsStandData = $0 })
            .store(in: &cancellable)
    }
}
