//
//  VehiclesController.swift
//  CarRentalApp
//
//  Created by Nazrin on 21.10.23.
//

import UIKit
import RealmSwift

class FirstRealm: Object {
    @Persisted var name: String = ""
    @Persisted var price: String = ""
    @Persisted var engine: String = ""
    @Persisted var categories: String = ""
    @Persisted var carImage: String = ""
    @Persisted var Marka: String = ""
    @Persisted var Month: String = ""
}
class VehiclesController: UIViewController, UISearchBarDelegate {
    var items = [FirstRealm]()
    let realm = try! Realm()
    var search: UISearchController!
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "VehiclesCell", bundle: nil), forCellWithReuseIdentifier: "VehiclesCell")
        setupSearchBar()
        collectionView.reloadData()
        if let url = realm.configuration.fileURL {
            print(url)
        }
        fetchItems()
    }
    func fetchItems() {
        let data = realm.objects(FirstRealm.self)
        items.append(contentsOf: data)
        collectionView.reloadData()
    }
}
extension VehiclesController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let search = UISearchBar()
        search.placeholder = "Search for a car"
        search.delegate = self
        view.addSubview(search)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehiclesCell", for: indexPath) as! VehiclesCell
        let item = items[indexPath.row]
        cell.carImage.image = UIImage(named: item.carImage)
        cell.label1.text = item.engine
        cell.label2.text = item.categories
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        //        let selectedItem = items[indexPath.row]
        let controller = storyboard?.instantiateViewController(withIdentifier: "SearchController") as! SearchController
        
        navigationController?.show(controller, sender: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 200)
    }
}
extension VehiclesController {
    func setupSearchBar() {
        search = UISearchController(searchResultsController: nil)
        search.searchBar.delegate = self
        search.searchBar.placeholder = "Search for a car"
        navigationItem.searchController = search
        definesPresentationContext = true
    }
}


