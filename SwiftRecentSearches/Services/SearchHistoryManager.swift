//
//  SearchHistoryManager.swift
//  SwiftRecentSearches
//
//  Created by Erik Valencia Cardona on 15/10/26.
//

import UIKit

final class SearchHistoryManager{
    
    private let defaults: UserDefaults
    private let historyKey = "recentSearches"
    private let maxSearches = 5
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func saveSearch(_ term: String) {
        let searchTerm = term.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        
        guard !searchTerm.isEmpty else {
                print("DEBUG: Search term is empty")
                return
            }
        
        var searches = loadSearches()
        print("DEBUG: Before saving: \(searches)")
        
        searches.append(searchTerm)

        if searches.count > maxSearches {
            searches.removeFirst()
        }
        
        defaults.set(searches, forKey: historyKey)
        print("DEBUG: After saving: \(searches)")
        print("DEBUG: Read back from UserDefaults: \(loadSearches())")
    }
    
    func loadSearches() -> [String] {
        defaults.stringArray(forKey: historyKey) ?? []
    }
    
    func clearSearches() {defaults.removeObject(forKey: historyKey)}
}
