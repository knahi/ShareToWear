//
//  RentedTableViewCell.swift
//  ShareToWear
//
//  Created by Lily Taub on 5/16/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//
// Configures cell in table of user's rented dresses

import UIKit

class RentedTableViewCell: UITableViewCell {

    @IBOutlet weak var dressID: UILabel!
    @IBOutlet weak var deliveryMethod: UILabel!
    @IBOutlet weak var deliveryDate: UILabel!

    //configures cells in Rented Dresses table
    func configureCell(dress: RentInfo){
        dressID.text = dress.dressName
        deliveryMethod.text = dress.deliveryMethod
        deliveryDate.text = dress.date
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
