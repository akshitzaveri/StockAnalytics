//
//  Stock.swift
//  StockAnalytics
//
//  Created by Akshit Zaveri on 23/03/20.
//  Copyright © 2020 Akshit Zaveri. All rights reserved.
//

import Foundation

final class Stock {

  /// Unique ID of the Stock
  let identifier: Int

  /// User facing name of the stock
  let name: String

  /// The price at which the stock currently trades
  var currentPrice: Float

  /// The price at which the stock previously closed.
  var previousClosingPrice: Float

  /// Negative/Positive Percentage of change from previous close compared to the current price
  var percentChangeFromPreviousClosingPrice: Float {
    (currentPrice*100/previousClosingPrice)-100
  }

  init(
    identifier: Int,
    name: String,
    currentPrice: Float,
    previousClosingPrice: Float
  ) {
    self.identifier = identifier
    self.name = name
    self.currentPrice = currentPrice
    self.previousClosingPrice = previousClosingPrice
  }
}
