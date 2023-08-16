//
//  CoinData.swift
//  ByteCoin
//
//  Created by Mpilo Pillz on 2023/08/17.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let time: String
    let asset_id_base: String
    let  asset_id_quote: String
    let  rate: Double
}
