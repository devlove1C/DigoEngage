//
//  EngageGeoLocation.swift
//  PSL-Engage-SDK
//
//  Created by dlovewanshi on 30/11/23.
//

import Foundation

public struct EngageGeoLocation {
     var latitute: Double
     var longitute: Double
    
    //Initialize the object with latitute and longitute para
   public init(withlatitute latitute: Double, andlongitute longitute: Double) {
        self.latitute = latitute
        self.longitute = longitute
    }
}

