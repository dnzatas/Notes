# Collection View

```swift

//  ViewController.swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ulkeCollectionView: UICollectionView!
    
    var ulkeler = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let design:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let viewWidth = self.ulkeCollectionView.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 5
        design.minimumLineSpacing = 5
        design.itemSize = CGSize(width: (viewWidth-30)/3, height: (viewWidth-30)/3)
        ulkeCollectionView.collectionViewLayout = design
        
        ulkeCollectionView.delegate = self
        ulkeCollectionView.dataSource = self
        
        ulkeler = ["Turkey", "Germany", "France", "Spain", "Iceland", "USA", "Africa", "Ireland", "Egypt"]
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ulkeler.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ulkeCell", for: indexPath) as! UlkeCollectionViewCell
        cell.ulkeLabel.text = ulkeler[indexPath.row]
        
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 60
        
        return cell
    }
    
}


//  UlkeCollectionViewCell.swift
import UIKit

class UlkeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ulkeLabel: UILabel!
    
}

```

