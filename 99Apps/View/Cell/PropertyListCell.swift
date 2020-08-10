//
//  PropertyListCell.swift
//  99Apps
//
//  Created by herlangga wibi on 06/08/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import UIKit
import Kingfisher

class PropertyListCell: UITableViewCell {
    
    @IBOutlet weak var imgProperty: UIImageView!
    @IBOutlet weak var priceProperty: UILabel!
    @IBOutlet weak var titleProperty: UILabel!
    @IBOutlet weak var locationProperty: UILabel!
    @IBOutlet weak var favouriteProperty: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureData(_ data: List?) {
        let source = DataImg(url: URL(string: data?.image ?? "")!, cacheKey: "")
        self.imgProperty.kf.setImage(with: source)
        self.priceProperty.text = data?.attribute.price
        self.titleProperty.text = data?.title
        self.locationProperty.text = data?.location.address
    }
    
    @IBAction func callContact(_ sender: UIButton) {
        Utilities.call()
    }
    
}

class DataImg: Resource {
    
    
    public var cacheKey: String
    
    public var downloadURL: URL
    
    init(url: URL, cacheKey: String) {
        self.downloadURL = url
        self.cacheKey = cacheKey
    }
}
