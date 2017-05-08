//
//  SubmitReviewViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/26/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class SubmitReviewViewController: UIViewController {
    
    //var collection = [dressShared]()

    @IBOutlet weak var done: UIBarButtonItem!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dressTitleLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var bannerwebIDLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var preferredPriceLabel: UILabel!
   
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        
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
        typeLabel.text = DressReview.type
        dressTitleLabel.text = DressReview.dressTitle
        userNameLabel.text = DressReview.userName
        bannerwebIDLabel.text = DressReview.bannerWebID
        var colorString = ""
        if DressReview.red{
            colorString = "Red "
        }
        if DressReview.blue{
            colorString += "Blue "
        }
        if DressReview.yellow{
            colorString += "Yellow "
        }
        if DressReview.pink{
            colorString += "Pink "
        }
        if DressReview.white{
            colorString += "White "
        }
        if DressReview.black{
            colorString += "Black "
        }
        if DressReview.green{
            colorString += "Green "
        }
        if DressReview.orange{
            colorString += "Orange "
        }
        if DressReview.purple{
            colorString += "Purple "
        }
        if DressReview.gray{
            colorString += "Gray "
        }
        if DressReview.multicolor{
            colorString += "Multicolor "
        }
        colorLabel.text = colorString
        
        //Size
        if DressReview.size0{
            sizeLabel.text = "0"
        }
        if DressReview.size2{
            sizeLabel.text = "2"
        }
        if DressReview.size4{
            sizeLabel.text = "4"
        }
        if DressReview.size6{
            sizeLabel.text = "6"
        }
        if DressReview.size8{
            sizeLabel.text = "8"
        }
        if DressReview.size10{
            sizeLabel.text = "10"
        }
        if DressReview.size12{
            sizeLabel.text = "12"
        }
        if DressReview.size14{
            sizeLabel.text = "14"
        }
        if DressReview.sizeXS{
            sizeLabel.text = "XS"
        }
        if DressReview.sizeS{
            sizeLabel.text = "S"
        }
        if DressReview.sizeM{
            sizeLabel.text = "M"
        }
        if DressReview.sizeL{
            sizeLabel.text = "L"
        }
        if DressReview.sizeXL{
            sizeLabel.text = "XL"
        }
        else {
            sizeLabel.text = " "
        }
        
        
        brandLabel.text = DressReview.brand
        originalPriceLabel.text = DressReview.originalPrice
        preferredPriceLabel.text = DressReview.preferredPrice
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //tabBarController?.selectedIndex = 0
        _ = navigationController?.popToRootViewController(animated: true)
//        self.navigationController?.popToViewController(, animated: true)
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
