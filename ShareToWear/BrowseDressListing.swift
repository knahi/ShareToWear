//
//  BrowseDressListing.swift
//  ShareToWear
//
//  Created by Kayla Nahi on 4/27/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import Foundation
import Firebase


class DressListing{
    
    var color:String
    var size: String
    var availability: Bool
    var price: Int
    //var ref: FIRDatabaseReference?
   
    init(color:String, size:String, availability:Bool, price:Int){
        self.color = color
        self.availability = availability
        self.price = price
        self.size = size
    }
    
    //NEED TO FIX THIS
//    init(snapshot: FIRDataSnapshot) {
//        //key = snapshot.key
//        let snapshotValue = snapshot.value as! [String: AnyObject]
//        color = snapshotValue["color"] as! String
//        size = snapshotValue["size"] as! String
//        availability = snapshotValue["availability"] as! Bool
//        price = snapshotValue["price"] as! Int
//        ref = snapshot.ref
//    }
}
