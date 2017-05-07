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
    var flag = false

    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var dressImage: UIImageView!
    @IBOutlet weak var rentButton: UIButton!
    @IBOutlet weak var notAvailableLabel: UILabel!
    @IBOutlet weak var dressName: UILabel!
    @IBOutlet weak var heartButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorLabel.text = ""
        sizeLabel.text = ""
        priceLabel.text = ""
        availableLabel.text = ""
        dressImage.image = nil
        dressName.text = FavModel.currentSelection
        
        heartButton.setImage(UIImage(named: "unlike.png"), for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeImage(_ sender: Any) {
        
        if (!flag)
        {
            //for like
            flag = true
            heartButton.setImage(UIImage(named: "like.png"), for: .normal)
            //let dress = DressListing(color: <#T##String#>, size: <#T##String#>, availability: <#T##Bool#>, price: <#T##Int#>)
            //FavModel.favorites.append(<#T##newElement: DressListing##DressListing#>)
        }
        else
        {
            //for unlike
            flag = false
            heartButton.setImage(UIImage(named: "unlike.png"), for: .normal)
        }
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
