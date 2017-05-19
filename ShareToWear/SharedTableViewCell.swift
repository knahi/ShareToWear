//
//  SharedTableViewCell.swift
//  ShareToWear
//
//  Created by Kayla Nahi on 5/16/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class SharedTableViewCell: UITableViewCell {
    
    //Configures the cell for the table view to display shared dresses using a BannerWeb ID.

    @IBOutlet weak var dressTitle: UILabel!
    @IBOutlet weak var dressType: UILabel!
    @IBOutlet weak var dressSize: UILabel!
    @IBOutlet weak var dressBrand: UILabel!
    
    
    func configureCell(dress: SubmitInfo){
        dressTitle.text = dress.dressTitle
        dressType.text = dress.type
        dressSize.text = dress.size
        dressBrand.text = dress.brand
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
