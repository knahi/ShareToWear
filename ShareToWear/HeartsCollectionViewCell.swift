//
//  HeartsCollectionViewCell.swift
//  ShareToWear
//
//  Created by Kayla Nahi on 5/8/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class HeartsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dressCell: UIImageView!
    
    func configureCell(_ dressImage: UIImage){
        self.dressCell.image = dressImage
    }
    
}
