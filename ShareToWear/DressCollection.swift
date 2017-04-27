//
//  DressCollection.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/26/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import Foundation

class DressCollection{
    
    var collection = [DressListing]()
    
    init(){
        collection += [
            DressListing(color: "black", size: "S", availability: true, price: 15),
            DressListing(color: "red", size: "M", availability: true, price: 20),
            DressListing(color: "blue", size: "L", availability: true, price: 18),
            DressListing(color: "yellow", size: "6", availability: false, price:25),
            DressListing(color: "green", size: "4", availability: false, price: 12),
            DressListing(color: "orange", size: "S", availability: true, price: 22)
        ]
    }
}
