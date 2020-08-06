//
//  PropertyListCell.swift
//  99Apps
//
//  Created by herlangga wibi on 06/08/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import UIKit

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
    
}
