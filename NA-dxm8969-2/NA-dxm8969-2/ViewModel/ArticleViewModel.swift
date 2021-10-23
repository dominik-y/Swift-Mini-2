//
//  ArticleViewModel.swift
//  NA-dxm8969-2
//
//  Created by Dominik Maric on 22.10.2021..
//

import SwiftUI
import Foundation
import Combine

class ArticleViewModel: ObservableObject{
    
    @Published private(set) var articleData: [Article] = []
    
    private let mockableUrl =
        "https://70o99.mocklab.io/news"
    
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
            .decode(type: [Article].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { self.articleData = $0 })
            .store(in: &cancellable)
    }
}
