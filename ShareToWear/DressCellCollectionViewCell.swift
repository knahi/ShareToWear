//
//  DressCellCollectionViewCell.swift
//  ShareToWear
//
//  Created by Kayla Nahi on 5/5/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit
import Firebase

class DressCellCollectionViewCell: UICollectionViewCell {
    //Assigns dress image to cell of the collection view on browse page.
    
    @IBOutlet weak var dressCell: UIImageView!
    
    func configureCell(_ dressImage: UIImage){
        self.dressCell.image = dressImage
    }

}
