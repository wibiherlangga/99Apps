
//
//  Utilities.swift
//  99Apps
//
//  Created by herlangga wibi on 10/08/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    static func call() {
        if let url = URL(string: "tel://213"),
        UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    static func share(data: List, vc: UIViewController) {
        let data = ["wibi"]
        let activityController = UIActivityViewController(activityItems: data, applicationActivities: nil)
        vc.present(activityController, animated: true, completion: nil)
    }
}
