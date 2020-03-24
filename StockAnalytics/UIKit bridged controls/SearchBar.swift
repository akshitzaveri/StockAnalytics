//
//  SearchBar.swift
//  StockAnalytics
//
//  Created by Akshit Zaveri on 22/03/20.
//  Copyright © 2020 Akshit Zaveri. All rights reserved.
//

import SwiftUI

/// A SearchBar class which helps to represent a UISearchBar into SwiftUI views
struct SearchBar {

  /// The text from the search bar
  @Binding var text: String

  /// Placeholder that will be displayed in the search bar
  var placeholder: String
}

// MARK: - Adding UISearchBar type compatibility
extension SearchBar: UIViewRepresentable {

  typealias UIViewType = UISearchBar

  internal func makeCoordinator() -> Coordinator {
    Coordinator(text: $text)
  }

  internal func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UIViewType {
    let searchBar = UISearchBar(frame: .zero)
    searchBar.delegate = context.coordinator
    searchBar.placeholder = placeholder
    searchBar.searchBarStyle = .minimal
    searchBar.autocapitalizationType = .none
    return searchBar
  }

  internal func updateUIView(
    _ uiView: UIViewType,
    context: UIViewRepresentableContext<SearchBar>
  ) {
    uiView.text = text
  }
}

// MARK: - Coordinator for the delegate of the search bar
extension SearchBar {

  internal class Coordinator: NSObject {
    @Binding var text: String

    init(text: Binding<String>) {
      _text = text
    }
  }
}

extension SearchBar.Coordinator: UISearchBarDelegate {

  func searchBar(
    _ searchBar: UISearchBar,
    textDidChange searchText: String
  ) {
    /// Updating the entire binding chain so the view implementing Seachbar will have correct text when needed
    text = searchText
  }
}
