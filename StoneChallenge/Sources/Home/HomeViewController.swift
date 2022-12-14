import UIKit

class HomeViewController: UIViewController {
    
    let collectionView: HomeView = HomeView()
    var characters: [Character] = []
    var canLoad = true
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(collectionView)
        collectionView.bindCollection(dataSource: self, delegate: self)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        DataManager.shared.getAllCharacters {
            if let results = DataManager.shared.apiResponse?.results {
                self.characters = results
            }
            self.collectionView.characterCollection.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as? CharacterCollectionViewCell else {
            preconditionFailure("Cell not found")
        }
        
        let character = characters[indexPath.row]
        
        if let cachedImage = DataManager.shared.imageCash.object(forKey: NSNumber(value: character.id)) {
            cell.setupImage(image: cachedImage)
        }
        
        cell.layer.cornerRadius = 15
        cell.characterName.text = character.name
        cell.characterStatus.image = UIImage(named: defineImageStatus(status: character.status)) 
        cell.characterSpecie.text = character.species
        cell.backgroundColor = UIColor(named: "greenRick")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width-16, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == characters.count-1 && canLoad {
            canLoad = false
            DataManager.shared.getAllCharacters {
                if let results = DataManager.shared.apiResponse?.results {
                    self.characters += results
                    self.canLoad = true
                    collectionView.reloadData()
                }
            }
        }
    }
    
    func defineImageStatus(status: String) -> String {
        if status == "Alive" {
            return "aliveIcon"
        } else if status == "Dead" {
            return "deadIcon"
        } else {
            return "unknownIcon"
        }
    }
}

