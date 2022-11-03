//
//  ViewController.swift
//  MusicLibrary
//
//  Created by Twinbit Limited on 2/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var musicLibrayTableView: UITableView!
    lazy var searchBar = UISearchBar(frame: .zero)
    private lazy var searchController: UISearchController = {
          let sc = UISearchController(searchResultsController: nil)
          sc.searchResultsUpdater = self
          sc.delegate = self
          sc.obscuresBackgroundDuringPresentation = false
          sc.searchBar.placeholder = "Search"
          sc.searchBar.autocapitalizationType = .allCharacters
          return sc
      }()
    private func setupNavigationBar() {
        navigationItem.searchController = searchController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Music Library"
        navigationController?.navigationBar.prefersLargeTitles = true
        searchBar.placeholder = "Search"
        setupNavigationBar()
        musicLibrayTableView.delegate = self
        musicLibrayTableView.dataSource = self
       
    }


}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You taped me")
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicLibrayTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomeTableViewCell
        
        cell.lblCell.text = "Album"
        
     
       return cell
        
    }
     
}
extension ViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
        print(searchController.searchBar.text)
       
        //        else {
        //         filteredObjects = sections.filter{ $0secctions.data.name.range(of: searchString, options: .caseInsensitive) != nil }
        //       }
 
        
    }
}
