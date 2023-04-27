//
//  HomeView.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 23/04/2023.
//

import UIKit

class HomeView: UIViewController, HomeViewProtocol {
    
    var presenter: HomePresenterProtocol?
    
    let searchController = UISearchController(searchResultsController: nil)

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeSearchController()
        self.initializeSearchTextsTableView()
        self.initializeCategoryCollectionView()
        
        self.presenter?.onViewDidLoad()
    }
    
    func initializeSearchController(){
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    func initializeSearchTextsTableView(){
        self.tableView.isHidden = true
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: SearchTextViewCell.identifier, bundle: nil), forCellReuseIdentifier: SearchTextViewCell.identifier)
    }
    
    func initializeCategoryCollectionView(){
        UIHelper.setDefaultFlowLayour(collectionView: self.collectionView)
        self.collectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func showCategories() {
        tableView.isHidden = true
        collectionView.isHidden = false
    }
    
    func showSearch() {
        tableView.isHidden = false
        collectionView.isHidden = true
    }
}

extension HomeView: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.showCategories()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            self.presenter?.saveTextSearched(text: text)
            self.tableView?.reloadData()
            self.presenter?.searchWithText(text: text)
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.showSearch()
    }
    
    func reloadCategoryData(){
        self.collectionView.reloadData()
    }
    
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.getNumberOfRows(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "SearchTextViewCell", for: indexPath) as! SearchTextViewCell
                
        let textSearched = self.presenter?.getTextsSearchedSelected(index: indexPath.row)
        cell.setSearch(search: textSearched ?? "")

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let textSearched = self.presenter?.getTextsSearchedSelected(index: indexPath.row) {
            searchController.searchBar.text = textSearched
            self.presenter?.searchWithText(text: textSearched)
        }
        
    }
    
}


extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate {
    // Implement the required methods of the UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the number of items to display
        return self.presenter?.getNumberOfRowsCollection(section: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.presenter?.getCollectionCell(collectionView: self.collectionView, indexPath: indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter?.tapCategory(indexPath: indexPath)
    }
}
