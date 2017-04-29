//
//  BrowseDressListing.swift
//  ShareToWear
//
//  Created by Kayla Nahi on 4/27/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import Foundation


class DressListing{
    var color:String
    var size: String
    var availability: Bool
    var price: Int
   
    init(color:String, size:String, availability:Bool, price:Int){
        self.color = color
        self.availability = availability
        self.price = price
        self.size = size
    }
}
