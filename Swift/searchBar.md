# Search Bar

```swift
//  ViewController.swift

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ulkeSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ulkeSearchBar.scopeButtonTitles = ["Birinci", "İkinci"]
        ulkeSearchBar.showsScopeBar = true
        
        ulkeSearchBar.delegate = self
        
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Aranan Kelime: \(searchText)")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancel Tıklandı")
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        if selectedScope == 0{
            print("Birinci Seçildi")
        }
        if selectedScope == 1{
            print("İkinci Seçildi")
        }
    }
}

```

