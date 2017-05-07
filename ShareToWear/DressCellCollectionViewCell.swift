//
//  DressCellCollectionViewCell.swift
//  ShareToWear
//
//  Created by Kayla Nahi on 5/5/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class DressCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dressCell: UIImageView!
    
    func getImage() {

        // Get a reference to the storage service using the default Firebase App
        let storage = FIRStorage.storage()
        
        // Create a storage reference from our storage service
        let storageRef = storage.reference()
        
        // Create a reference to the file you want to download
        let dressRef = storageRef.child("DressImages/dress81.JPG")
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        dressRef.data(withMaxSize: 1 * 1024 * 1024) { data, error in
        if error != nil {
            // Uh-oh, an error occurred!
            print("Image is too big")
        } else {
            // Data for "images/island.jpg" is returned
            let image = UIImage(data: data!)
            //print (image)
            if (self.dressCell != nil) {
                print("not nill")
                self.dressCell.image = image
            }
        }
        }
    }
}
