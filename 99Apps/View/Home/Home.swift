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
    
    private let propertyListCell = "PropertyListCell"
    private let viewModel: HomeViewModel
    
    init(vm: HomeViewModel) {
        viewModel = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataAPI()
        setDelegate()
        setNavbar()
        
    }
    
    private func setDelegate() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: propertyListCell, bundle: nil), forCellReuseIdentifier: propertyListCell)
        tableView.tableFooterView = UIView()
    }
    
    private func setNavbar() {
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                                            target: self,
                                                            action: #selector(mapBtn(_:)))
    }
    
    private func getDataAPI() {
        
        viewModel.getPropertyList(success: { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }) {
            print("error get data API")
        }
    }
    
    @objc
    private func mapBtn(_ sender: UIButton) {
        let vc = Map()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension Home: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.propertyData?.data.list.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: propertyListCell, for: indexPath) as! PropertyListCell
        cell.selectionStyle = .none
        cell.configureData(viewModel.propertyData?.data.list[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Details()
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
