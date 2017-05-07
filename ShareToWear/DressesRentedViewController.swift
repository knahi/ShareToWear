//
//  DressesRentedViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/18/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class DressesRentedViewController: UIViewController {

    @IBOutlet weak var dressImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if(SubmitInfo.dressColor == "blue"){
//        dressImage.image = UIImage(named: "IMG_2395.jpg")
//        }else if(SubmitInfo.dressColor == "black"){
//              dressImage.image = UIImage(named: "IMG_2339.jpg")
//        }else if(SubmitInfo.dressColor == "yellow"){
//            dressImage.image = UIImage(named: "IMG_2422.jpg")
//        }else if(SubmitInfo.dressColor == "red"){
//            dressImage.image = UIImage(named: "IMG_2379.jpg")
//        }else{
//            infoLabel.text = "No dresses rented yet!"
//        }
        
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
