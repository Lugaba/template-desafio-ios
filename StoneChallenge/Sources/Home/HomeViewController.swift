import UIKit

class HomeViewController: UIViewController {
    
    let collectionView: HomeView = HomeView()
    var canLoad = true
    let dataManager = DataManager.shared
    
    override func loadView() {
        super.loadView()
        
        title = "Rick & Morty"
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
            self.collectionView.characterCollection.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataManager.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as? CharacterCollectionViewCell else {
            preconditionFailure("Cell not found")
        }
        
        let character = dataManager.characters[indexPath.row]
        cell.setupCell(character: character)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = dataManager.characters[indexPath.row]
        self.navigateToDetails(character: character)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width-16, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == dataManager.characters.count-1 && canLoad {
            canLoad = false
            DataManager.shared.getAllCharacters {
                self.canLoad = true
                collectionView.reloadData()
            }
        }
    }
    
    func navigateToDetails(character: Character) {
        let viewController = CharacterDetailsViewController()
        viewController.character = character
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

