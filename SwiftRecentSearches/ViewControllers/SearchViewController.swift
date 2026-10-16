//
//  ViewController.swift
//  SwiftRecentSearches
//
//  Created by Erik Valencia Cardona on 15/10/26.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let historyManager = SearchHistoryManager()
    
    @IBOutlet private weak var searchTextField: UITextField!
    
    @IBOutlet private weak var historyTableView: UITableView!
    
    @IBAction private func clearHistoryTapped(_sender: UIButton) {
        historyManager.clearSearches()
        loadSearchHistory()
    }
    
    private var searches: [String] = []
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        searchTextField.returnKeyType = .search
        searchTextField.autocorrectionType = .no
        title = "Recent Searches"
        
        historyTableView.dataSource = self
        
        loadSearchHistory()
        
        
    }
    
    @IBAction private func searchButtonTapped(_ sender: UIButton) {
        guard let term = searchTextField.text,
              !term.trimmingCharacters(
                in: .whitespacesAndNewlines
              ).isEmpty else {
            showEmptySearchAlert()
            return
        }
        
        historyManager.saveSearch(term)
        searchTextField.text = ""
        
        loadSearchHistory()
        view.endEditing(true)
        
        print("DEBUG: Search button tapped")
        print("DEBUG: Search term: \(term)")
        print("DEBUG: Saved searches: \(historyManager.loadSearches())")
    }
    
    private func loadSearchHistory() {
        searches = Array( historyManager.loadSearches().reversed())
        historyTableView.reloadData()
    }
    
    private func showEmptySearchAlert() {
        let alert = UIAlertController(
            title: "Empty Search",
            message: "Please enter a search term.",
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(title: "OK", style: .default)
        )
        
        present(alert, animated: true)
    }


}


extension SearchViewController: UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        searches.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "SearchCell",
            for: indexPath
        )
        
        cell.textLabel?.text = searches[indexPath.row]
        
        return cell
    }
}



extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        searchButtonTapped(UIButton())
        return true
    }
}

