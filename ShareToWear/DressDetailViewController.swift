//
//  DressDetailViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/26/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class DressDetailViewController: UIViewController {
    
    private let dresses = DressCollection()

    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var dressImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (DressButton.myButtonPressed == "black"){
            colorLabel.text = "black"
            sizeLabel.text = "S"
            priceLabel.text = "$15"
            availableLabel.text = "Yes"
            dressImage.image = UIImage(named: "IMG_2339.jpg")
        }else if(DressButton.myButtonPressed == "red"){
            colorLabel.text = "red"
            sizeLabel.text = "M"
            priceLabel.text = "$20"
            availableLabel.text = "Yes"
            dressImage.image = UIImage(named:"IMG_2379.jpg")
        }else if(DressButton.myButtonPressed == "blue"){
            colorLabel.text = "blue"
            sizeLabel.text = "L"
            priceLabel.text = "$18"
            availableLabel.text = "Yes"
            dressImage.image = UIImage(named: "IMG_2395.jpg")
        }else{
            colorLabel.text = "yellow"
            sizeLabel.text = "6"
            priceLabel.text = "$25"
            availableLabel.text = "No"
            dressImage.image = UIImage(named: "IMG_2422.jpg")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
