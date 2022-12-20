import UIKit

protocol ReloadCollectionView: AnyObject {
    func reloadCollectionView()
}

class HomeViewController: UIViewController {
    
    let homeView: HomeView = HomeView()
    var canLoad = true
    let dataManager = DataManager.shared
    
    override func loadView() {
        super.loadView()
        
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(homeView)
        homeView.bindCollection(dataSource: self, delegate: self)
        
        homeView.translatesAutoresizingMaskIntoConstraints = false
        homeView.translatesAutoresizingMaskIntoConstraints = false
        homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        homeView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        homeView.refreshControl.addTarget(self, action: #selector(removeFilter), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(dataFilter))
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "GetSchwifty-Regular", size: 20)!]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "GetSchwifty-Regular", size: 44)!]
        
        DataManager.shared.getAllCharacters {
            self.reloadCollectionView()
        }
    }
    
    func navigateToDetails(character: Character) {
        let viewController = CharacterDetailsViewController()
        viewController.character = character
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func dataFilter() {
        let viewController = FilterViewController()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc
    func removeFilter() {
        dataManager.characters = []
        dataManager.next = "https://rickandmortyapi.com/api/character"
        dataManager.getAllCharacters {
            self.homeView.refreshControl.endRefreshing()
            self.reloadCollectionView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dataManager.characters.isEmpty {
            self.homeView.setEmptyState()
        } else {
            self.homeView.removeEmptyState()
        }
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
                self.reloadCollectionView()
            }
        }
    }
}

extension HomeViewController: ReloadCollectionView {
    func reloadCollectionView() {
        self.canLoad = true
        self.homeView.reloadCollectionView()
    }
}

