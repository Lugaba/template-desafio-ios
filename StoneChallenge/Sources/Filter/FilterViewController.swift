//
//  FilterViewController.swift
//  StoneChallenge
//
//  Created by Luca Hummel on 17/12/22.
//

import UIKit

class FilterViewController: UIViewController {
    
    let filterView: FilterView = FilterView()
    
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
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
