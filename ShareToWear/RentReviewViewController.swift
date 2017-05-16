//
//  RentReviewViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/27/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class RentReviewViewController: UIViewController {

   @IBOutlet weak var dressImage: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var buildingLabel: UILabel!
    @IBOutlet weak var roomNumLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if presentingViewController is UITabBarController{
            dismiss(animated: true, completion: nil)
        }else if let owningNavController =
            navigationController{
            owningNavController.popViewController(animated: true)
        }else{
            fatalError("View is not contained by a navigation controller")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Use this to get dress image
        let dressName = String(FavModel.currentSelection) + ".JPG"
        dressImage.image = UIImage(named: dressName)
        
        //filling in labels
        nameLabel.text = FavModel.renterName
        emailLabel.text = FavModel.renterEmail
        deliveryLabel.text = FavModel.method
        dateLabel.text = FavModel.date
        priceLabel.text = "$ \(FavModel.price)"
        if(FavModel.method == "Pick Up"){
            buildingLabel.text = "N/A"
            roomNumLabel.text = "N/A"
        }else{
            buildingLabel.text = FavModel.building
            roomNumLabel.text = FavModel.roomNum
        }
        
        


        // Do any additional setup after loading the view.
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
