//
//  FavModel.swift
//  ShareToWear
//
//  Created by Kayla Nahi on 5/7/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class FavModel{
   
    
    static var color: String = ""
    static var price: String = ""
    static var size: String = ""
    static var available: Bool = true
    
    //currently selected dress
    static var currentSelection:String = ""
    
    //list of favorited dresses
    static var favorites = [String]()
    
    //list of all dresses displayed in Browse view
    static var allDresses = [String]()
    
    //Dress Rental Info
    static var method: String = ""
    static var renterName:String = ""
    static var renterEmail: String = ""
    static var building: String = ""
    static var roomNum: String = ""
    static var date: String = ""
}
