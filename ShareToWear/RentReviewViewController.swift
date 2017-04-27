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
    @IBOutlet weak var roomNumLabel: UILabel!
    @IBOutlet weak var buildingLabel: UILabel!
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
        
        nameLabel.text = SubmitInfo.name
        emailLabel.text = SubmitInfo.email
        if(SubmitInfo.dropOff){
            deliveryLabel.text = "Drop-Off"
            buildingLabel.text = SubmitInfo.building
            roomNumLabel.text = SubmitInfo.roomNum
        }else if(SubmitInfo.pickUp){
            deliveryLabel.text = "Pickup"
            buildingLabel.text = "N/A"
            roomNumLabel.text = "N/A"
        }
        if(DressButton.myButtonPressed == "black"){
            priceLabel.text = "$15"
             dressImage.image = UIImage(named: "IMG_2339.jpg")
            SubmitInfo.dressColor = "black"
        }
        if(DressButton.myButtonPressed == "red"){
            dressImage.image = UIImage(named: "IMG_2379.jpg")
            priceLabel.text = "$20"
            SubmitInfo.dressColor = "red"
        }
        if(DressButton.myButtonPressed == "blue"){
            dressImage.image = UIImage(named: "IMG_2395.jpg")
            priceLabel.text = "$18"
            SubmitInfo.dressColor = "blue"
        }
        if(DressButton.myButtonPressed == "yellow"){
            dressImage.image = UIImage(named: "IMG_2422.jpg")
            priceLabel.text = "$25"
            SubmitInfo.dressColor = "yellow"
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
