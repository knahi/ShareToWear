//
//  RentDressModel.swift
//  ShareToWear
//
//  Created by Lily Taub on 5/8/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import Foundation

struct RentInfo{
    let renterName: String
    let renterEmail: String
    let deliveryMethod: String
    let dressName: String
    let building: String
    let roomNumber: String
    

    init(renterName: String, renterEmail: String, deliveryMethod: String, dressName: String, building: String, roomNumber:String){
        self.renterName = renterName
        self.renterEmail = renterEmail
        self.deliveryMethod = deliveryMethod
        self.dressName = dressName
        self.building = building
        self.roomNumber = roomNumber
    }
    func toAnyObject() -> Any{
        return [
            "renterName": renterName,
            "renterEmail": renterEmail,
            "deliveryMethod": deliveryMethod,
            "dressName": dressName,
            "building": building,
            "roomNumber": roomNumber
        ]
    }
}

