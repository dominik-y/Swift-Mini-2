//
//  NewsStand.swift
//  NA-2
//
//  Created by Andrej Saric.
//

import Foundation

struct NewsStand: Codable {
    let id: Int
    let name: String
    let location: Location
    let category: Category
}
