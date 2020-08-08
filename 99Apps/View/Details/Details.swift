//
//  Details.swift
//  99Apps
//
//  Created by herlangga wibi on 06/08/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import UIKit

class Details: UIViewController {
    
    @IBOutlet weak var propertyPrice: UILabel!
    @IBOutlet weak var propertyTitle: UILabel!
    @IBOutlet weak var propertyLocation: UILabel!
    @IBOutlet weak var propertyDescription: UILabel!
    @IBOutlet weak var propertyFacilites: UILabel!
    @IBOutlet weak var agentName: UILabel!
    @IBOutlet weak var agentPosition: UILabel!
    
    var details: List?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        setData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setData() {
        propertyPrice.text = details?.attribute.price
        propertyTitle.text = details?.title
        propertyLocation.text = details?.location.address
        propertyDescription.text = details?.listDescription
        propertyFacilites.text = details?.fasilities.rawValue
        agentName.text = details?.agent.name
        agentPosition.text = details?.agent.type.rawValue
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
