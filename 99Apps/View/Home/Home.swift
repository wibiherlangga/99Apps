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
    
    let propertyListCell = "PropertyListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setNavbar()
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: propertyListCell, bundle: nil), forCellReuseIdentifier: propertyListCell)
    }
    
    private func setNavbar() {
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(mapBtn(_:)))
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
        let cell = tableView.dequeueReusableCell(withIdentifier: propertyListCell, for: indexPath) as! PropertyListCell
        cell.selectionStyle = .none
        cell.titleProperty.text = "fdasfdfdsfasdf"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
}
