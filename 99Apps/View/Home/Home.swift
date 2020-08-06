//
//  ViewController.swift
//  99Apps
//
//  Created by herlangga wibi on 06/08/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import UIKit

class Home: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setNavbar()
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setNavbar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchBar)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(mapBtn(_:)))
    }
    
    @objc
    private func mapBtn(_ sender: UIButton) {
        print("open map")
    }
}

extension Home: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        return cell
    }
    
    
}
