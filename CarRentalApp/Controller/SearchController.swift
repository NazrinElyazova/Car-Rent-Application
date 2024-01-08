//
//  SearchController.swift
//  CarRentalApp
//
//  Created by Nazrin on 25.10.23.
//

import UIKit
import RealmSwift

class SearchController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var collection: UICollectionView!
    var items = [FirstRealm]()
    let realm = try! Realm()
    var search: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        collection.register(UINib(nibName: "CarCell", bundle: nil), forCellWithReuseIdentifier: "CarCell")
        search = UISearchController(searchResultsController: nil)
        search.searchBar.delegate = self
        navigationItem.searchController = search
        definesPresentationContext = true
        collection.reloadData()
        setupSearchBar()
        if let url = realm.configuration.fileURL {
            print(url)
        }
        fetchItems()
    }
    func fetchItems() {
        let data = realm.objects(FirstRealm.self)
        items.append(contentsOf: data)
        collection.reloadData()
    }
}
extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCell", for: indexPath) as! CarCell
        let item = items[indexPath.row]
        cell.imageVie.image = UIImage(named: item.carImage)
        cell.engine.text = item.engine
        cell.name.text = item.name
        cell.price.text = item.price
        cell.category.text = item.categories
        cell.marka.text = item.Marka
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        //            let selectedItem = items[indexPath.row]
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 350, height: 350)
    }
}
extension SearchController {
    func setupSearchBar() {
        search = UISearchController(searchResultsController: nil)
        search.searchBar.delegate = self
        search.searchBar.placeholder = "Search for a car"
        navigationItem.searchController = search
        definesPresentationContext = true
    }
}
