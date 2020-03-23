//
//  StockTests.swift
//  StockAnalyticsTests
//
//  Created by Akshit Zaveri on 23/03/20.
//  Copyright © 2020 Akshit Zaveri. All rights reserved.
//

import XCTest
@testable import StockAnalytics

class StockTests: XCTestCase {

  var sut: Stock!

  override func tearDown() {
    sut = nil
  }

  // swiftlint:disable numbers_smell
  func test_WhenCurrentPriceIsLessThanPreviousPrice_ThenPercentChangeIsNegative() {
    // given & when
    sut = .init(
      identifier: 1,
      name: "SENSEX",
      currentPrice: 27000.45,
      previousClosingPrice: 30000.97
    )

    // then
    XCTAssertEqual(
      sut.percentChangeFromPreviousClosingPrice,
      -10.001411
    )
  }

  func test_WhenCurrentPriceIsGreaterThanPreviousPrice_ThenPercentChangeIsNegative() {
    // given & when
    sut = .init(
      identifier: 1,
      name: "SENSEX",
      currentPrice: 30000.97,
      previousClosingPrice: 27000.45
    )

    // then
    XCTAssertEqual(
      sut.percentChangeFromPreviousClosingPrice,
      11.112854
    )
  }
  // swiftlint:enable numbers_smell
}
