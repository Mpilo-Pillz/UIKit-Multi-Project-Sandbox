//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Mpilo Pillz on 2023/08/16.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel: Codable {
    let time: String
    let assetIdBase: String
    let  assetIdQuote: String
    let rate: Double
}
