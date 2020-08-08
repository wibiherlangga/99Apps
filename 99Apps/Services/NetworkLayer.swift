//
//  NetworkLayer.swift
//  99Apps
//
//  Created by herlangga wibi on 08/08/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import Foundation

protocol NetworkLayerDelegate {
    func callAPI(success: @escaping (Data) -> Void, failure: @escaping () -> Void)
}

class NetworkLayer: NetworkLayerDelegate {
    
    let base_URL = "https://api.jsonbin.io/b/5e1552c35df6407208319336/1"
    
    func callAPI(success: @escaping (Data) -> Void, failure: @escaping () -> Void) {
        
        let url = URL(string: base_URL)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("$2b$10$z032e5RzBFljvw44bmQIyeDpK7yxz.gh9W2NO5VuiLtXfDciFYWq2", forHTTPHeaderField: "Secret-Key")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {
                print("response more than 200!, please re-check again")
                return
            }
            
            guard let data = data, error == nil else {
                print("error: \(String(describing: error))")
                return
            }
            success(data)
        }.resume()
        
    }
}
