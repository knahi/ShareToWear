//
//  SubmitInfoModel.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/26/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import Foundation
//import UIKit

struct SubmitInfo{
    
    let type: String
    let dressTitle:String
    let userName: String
    let bannerWebID:String
    let brand: String
    let originalPrice:String
    let preferredPrice:String
    let size:String
    let color:[String]
    
    
    
    
    
//    static var type:String = ""
//    static var dressTitle:String = ""
//    static var userName:String = ""
//    static var bannerWebID:String = ""
//    static var brand:String = ""
//    static var originalPrice:String = ""
//    static var preferredPrice:String = ""
//    
//    //sizes
//    static var size0:Bool = false
//    static var size2:Bool = false
//    static var size4:Bool = false
//    static var size6:Bool = false
//    static var size8:Bool = false
//    static var size10:Bool = false
//    static var size12:Bool = false
//    static var size14:Bool = false
//    static var sizeXS:Bool = false
//    static var sizeS:Bool = false
//    static var sizeM:Bool = false
//    static var sizeL:Bool = false
//    static var sizeXL:Bool = false
//    
//    //colors
//    static var white:Bool = false
//    static var blue:Bool = false
//    static var yellow:Bool = false
//    static var pink:Bool = false
//    static var red:Bool = false
//    static var black:Bool = false
//    static var green:Bool = false
//    static var orange:Bool = false
//    static var purple:Bool = false
//    static var gray:Bool = false
//    static var multicolor:Bool = false
    

    
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
            "colors":color
        ]
    }
    
    
    
    //DRESS RENTAL INFO (NEED TO PUT THIS IN NEW FILE
//    static var name:String = ""
//    static var email:String = ""
//    static var pickUp:Bool = false
//    static var dropOff:Bool = false
//    static var building:String = ""
//    static var roomNum:String = ""
//    static var time:String = ""
//    static var date:String = ""
//    static var dressColor:String = ""
    
    
    
}
