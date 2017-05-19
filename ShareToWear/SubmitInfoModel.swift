//
//  SubmitInfoModel.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/26/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import Foundation

struct SubmitInfo{
    //Takes in the information submitted by user, stores submission in an array
    
    let type: String
    let dressTitle:String
    let userName: String
    let bannerWebID:String
    let brand: String
    let originalPrice:String
    let preferredPrice:String
    let size:String
    let color:[String]
    
    init(type:String, dressTitle: String, userName: String, bannerWebID: String, brand: String, originalPrice: String, preferredPrice: String, size: String, color: [String]){
        self.type = type
        self.dressTitle = dressTitle
        self.userName = userName
        self.bannerWebID = bannerWebID
        self.brand = brand
        self.originalPrice = originalPrice
        self.preferredPrice = preferredPrice
        self.size = size
        self.color = color
        
    }
    
    func toAnyObject() -> Any {
        return [
            "type": type,
            "dressTitle": dressTitle,
            "userName": userName,
            "brand":brand,
            "originalPrice":originalPrice,
            "preferredPrice": preferredPrice,
            "size": size,
            "colors":color,
            "bannerWebID": bannerWebID
        ]
    }
    
}
