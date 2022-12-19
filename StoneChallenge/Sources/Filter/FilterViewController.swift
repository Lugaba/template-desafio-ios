//
//  FilterViewController.swift
//  StoneChallenge
//
//  Created by Luca Hummel on 17/12/22.
//

import UIKit

class FilterViewController: UIViewController {
    
    let filterView: FilterView = FilterView()
    let dataManager = DataManager.shared
    weak var delegate: ReloadCollectionView?
    
    override func loadView() {
        super.loadView()
        
        title = "Filter"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = UIColor(named: "backgroundRick")
        view.addSubview(filterView)

        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        filterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        filterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        filterView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        filterView.filterButton.addTarget(self, action: #selector(filterCharacters), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc
    func filterCharacters() {
        var name = self.filterView.getValueTextField()
        if name.isEmpty {
            name = "Rick"
        }
        let status = self.filterView.getStatusSelected()
        dataManager.filterCharacters(name: name, status: status) {
            self.delegate?.reloadCollectionView()
            self.navigationController?.popViewController(animated: true)
        }
    }
}
