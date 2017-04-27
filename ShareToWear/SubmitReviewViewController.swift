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
        typeLabel.text = SubmitInfo.type
        dressTitleLabel.text = SubmitInfo.dressTitle
        userNameLabel.text = SubmitInfo.userName
        bannerwebIDLabel.text = SubmitInfo.bannerWebID
        var colorString = ""
        if SubmitInfo.red{
            colorString = "Red "
        }
        if SubmitInfo.blue{
            colorString += "Blue "
        }
        if SubmitInfo.yellow{
            colorString += "Yellow "
        }
        if SubmitInfo.pink{
            colorString += "Pink "
        }
        if SubmitInfo.white{
            colorString += "White "
        }
        if SubmitInfo.black{
            colorString += "Black "
        }
        if SubmitInfo.green{
            colorString += "Green "
        }
        if SubmitInfo.orange{
            colorString += "Orange "
        }
        if SubmitInfo.purple{
            colorString += "Purple "
        }
        if SubmitInfo.gray{
            colorString += "Gray "
        }
        colorLabel.text = colorString
        
        //Size
        if SubmitInfo.size2{
            sizeLabel.text = "2"
        }
        if SubmitInfo.size4{
            sizeLabel.text = "4"
        }
        if SubmitInfo.size6{
            sizeLabel.text = "6"
        }
        if SubmitInfo.size8{
            sizeLabel.text = "8"
        }
        if SubmitInfo.size10{
            sizeLabel.text = "10"
        }
        if SubmitInfo.size12{
            sizeLabel.text = "12"
        }
        if SubmitInfo.size14{
            sizeLabel.text = "14"
        }
        if SubmitInfo.sizeXS{
            sizeLabel.text = "XS"
        }
        if SubmitInfo.sizeS{
            sizeLabel.text = "S"
        }
        if SubmitInfo.sizeM{
            sizeLabel.text = "M"
        }
        if SubmitInfo.sizeL{
            sizeLabel.text = "L"
        }
        if SubmitInfo.sizeXL{
            sizeLabel.text = "XL"
        }
        
        brandLabel.text = SubmitInfo.brand
        originalPriceLabel.text = SubmitInfo.originalPrice
        preferredPriceLabel.text = SubmitInfo.preferredPrice
        
//        init(){
//            collection += [
//                dressShared(type: typeLabel.text!, title: dressTitleLabel.text!, userName: userNameLabel.text!, bannerWebID: bannerwebIDLabel.text!, color: colorLabel.text!, size: sizeLabel.text!, brand: brandLabel.text!, originalPrice: originalPriceLabel.text!, preferredPrice: preferredPriceLabel.text!)
//            ]
//        }
        
//        let shared = dressShared(type: typeLabel.text!, title: dressTitleLabel.text!, userName: userNameLabel.text!, bannerWebID: bannerwebIDLabel.text!, color: colorLabel.text!, size: sizeLabel.text!, brand: brandLabel.text!, originalPrice: originalPriceLabel.text!, preferredPrice: preferredPriceLabel.text!)
//        
//        UserInfo.sharedCollection.append(shared)
//        print("dress added to collection")
//        print(UserInfo.sharedCollection.count)
        

        // Do any additional setup after loading the view.
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
