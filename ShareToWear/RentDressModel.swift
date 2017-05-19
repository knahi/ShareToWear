//
//  RentDressModel.swift
//  ShareToWear
//
//  Created by Lily Taub on 5/8/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import Foundation

//Model for renting dresses, returns essential information in an array.

struct RentInfo{
    let renterName: String
    let renterEmail: String
    let deliveryMethod: String
    let dressName: String
    let building: String
    let roomNumber: String
    let date: String
    

    init(renterName: String, renterEmail: String, deliveryMethod: String, dressName: String, building: String, roomNumber:String, date:String){
        self.renterName = renterName
        self.renterEmail = renterEmail
        self.deliveryMethod = deliveryMethod
        self.dressName = dressName
        self.building = building
        self.roomNumber = roomNumber
        self.date = date
    }
    func toAnyObject() -> Any{
        return [
            "renterName": renterName,
            "renterEmail": renterEmail,
            "deliveryMethod": deliveryMethod,
            "dressName": dressName,
            "building": building,
            "roomNumber": roomNumber,
            "date": date
        ]
    }
}

