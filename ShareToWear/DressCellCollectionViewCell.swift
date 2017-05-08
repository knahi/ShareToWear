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
    
    @IBOutlet weak var dressCell: UIImageView!
    //@IBOutlet weak var dressName: UILabel!
    
    func configureCell(_ dressImage: UIImage){
//        let size = dressImage.size.applying(CGAffineTransform(scaleX: 0.2, y: 0.2))
//        let hasAlpha = false
//        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
//        
//        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
//        dressImage.draw(in: CGRect(origin: CGPointZero, size: size))
//        
//        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
        print(self.dressCell.bounds)
        
        self.dressCell.image = dressImage
        //self.dressCell.contentMode = .scaleAspectFit
    }

}
