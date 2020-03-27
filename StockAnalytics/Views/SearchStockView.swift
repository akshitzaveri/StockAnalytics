//
//  SearchStockView.swift
//  StockAnalytics
//
//  Created by Akshit Zaveri on 22/03/20.
//  Copyright © 2020 Akshit Zaveri. All rights reserved.
//

import SwiftUI

struct SearchStockView: View {

  private enum Constants {
    static let searchBarPlaceholder = "Search Stocks"
  }

  /// Search text entered by the user
  @State private var searchText = ""

  var body: some View {
    NavigationView {
      VStack {
        SearchBar(
          text: $searchText,
          placeholder: Constants.searchBarPlaceholder
        )
        Spacer()
      }.navigationBarTitle("Search")
    }
  }
}

struct ContentView_Previews: PreviewProvider {

  static var previews: some View {
    SearchStockView()
  }
}
