//
//  HomeViewModel.swift
//  99Apps
//
//  Created by herlangga wibi on 08/08/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var propertyData: Property?
    let services: NetworkLayerDelegate
    
    init(service: NetworkLayerDelegate = NetworkLayer()) {
        self.services = service
    }
    
    func getPropertyList(success: @escaping () -> Void, failure: @escaping () -> Void) {
        
        services.callAPI(success: { [weak self] (data) in
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Property.self, from: data)
                print("result: \(result)")
                self?.propertyData = result
                success()
            }
            catch {
                failure()
            }
        }) {
            failure()
        }
        
    }
    
}

