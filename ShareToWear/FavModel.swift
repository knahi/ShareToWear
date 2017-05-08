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
    
    //Dress Drop-off Info
    static var building: String = ""
    static var roomNum: String = ""
}
