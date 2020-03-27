//
//  ConfigurationTests.swift
//  StockAnalyticsTests
//
//  Created by Akshit Zaveri on 24/03/20.
//  Copyright © 2020 Akshit Zaveri. All rights reserved.
//

import XCTest
@testable import StockAnalytics

class ConfigurationTests: XCTestCase {

  private enum Constants {
    static let integerValueMock = 10
    static let floatValueMock: Float = 10.65
  }

  private enum Key {
    static let integerKey = "integerKey"
    static let floatKey = "floatKey"
    static let stringKey = "stringKey"
    static let missingKey = "missingKey"
    static let urlKey = "urlKey"
    static let booleanTrueKey = "booleanTrueKey"
    static let booleanFalseKey = "booleanFalseKey"
  }

  private func getCurrentBundle() -> Bundle {
    Bundle(for: self.classForCoder)
  }

  func test_WhenStringIsRequested_ThenStringIsFetched() {
    // given

    // when
    let result: String? = try? Configuration.value(
      for: Key.stringKey,
      in: getCurrentBundle()
    )

    // then
    XCTAssertEqual(result, "https://stock-analytics-server.herokuapp.com/api/stocks")
  }

  func test_WhenInvalidKeyIsRequested_ThenErrorIsReturned() {
    // given

    // when
    let result: String?
    do {
      result = try Configuration.value(
        for: Key.missingKey,
        in: getCurrentBundle()
      )

      // then
      XCTAssertEqual(result, nil)
    } catch Configuration.Error.missingKey {
      // Do nothing as this is expected to execute
    } catch {
      // then
      XCTAssertNoThrow(Configuration.Error.missingKey)
    }
  }

  func test_WhenIntegerRequested_ThenIntegerIsReturned() {
    // given
    let bundle = Bundle(for: self.classForCoder)

    // when
    let result: Int? = try? Configuration.value(
      for: Key.integerKey,
      in: bundle
    )

    // then
    XCTAssertEqual(result, Constants.integerValueMock)
  }

  func test_WhenFloatRequested_ThenFloatIsReturned() {
    // given

    // when
    let result: Float? = try? Configuration.value(
      for: Key.floatKey,
      in: getCurrentBundle()
    )

    // then
    XCTAssertEqual(result, Constants.floatValueMock)
  }

  func test_WhenTrueBooleanRequested_ThenTrueBooleanIsReturned() {
    // given

    // when
    let result: Bool! = try? Configuration.value(
      for: Key.booleanTrueKey,
      in: getCurrentBundle()
    )

    // then
    XCTAssertTrue(result)
  }

  func test_WhenFalseBooleanRequested_ThenFalseBooleanIsReturned() {
    // given

    // when
    let result: Bool! = try? Configuration.value(
      for: Key.booleanFalseKey,
      in: getCurrentBundle()
    )

    // then
    XCTAssertFalse(result)
  }

  func test_WhenInvalidValueIsRequested_ThenInvalidValueErrorIsThrown() {
    // given
    var result: Bool?

    // when
    do {
      result = try Configuration.value(
        for: Key.stringKey,
        in: getCurrentBundle()
      )
    } catch Configuration.Error.invalidValue {
      // then
      XCTAssertNil(result)
      XCTAssertTrue(true)
    } catch {
      // then
      XCTAssertNoThrow(Configuration.Error.invalidValue)
    }
  }
}
