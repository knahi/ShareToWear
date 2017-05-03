//
//  DressesSharedViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/18/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class DressesSharedViewController: UIViewController {
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var prefPriceLabel: UILabel!
    @IBOutlet weak var origPriceLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var bannerWebIDLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeLabel.text = SubmitInfo.type
        titleLabel.text = SubmitInfo.dressTitle
        prefPriceLabel.text = SubmitInfo.preferredPrice
        origPriceLabel.text = SubmitInfo.originalPrice
        brandLabel.text = SubmitInfo.brand
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
        if SubmitInfo.multicolor{
            colorString += "Multicolor "
        }
        colorLabel.text = colorString
        
        //Size
        if SubmitInfo.size0{
            sizeLabel.text = "0"
        }
        else if SubmitInfo.size2{
            sizeLabel.text = "2"
        }
        else if SubmitInfo.size4 {
            sizeLabel.text = "4"
        }
        else if SubmitInfo.size6{
            sizeLabel.text = "6"
        }
        else if SubmitInfo.size8{
            sizeLabel.text = "8"
        }
        else if SubmitInfo.size10{
            sizeLabel.text = "10"
        }
        else if SubmitInfo.size12{
            sizeLabel.text = "12"
        }
        else if SubmitInfo.size14{
            sizeLabel.text = "14"
        }
        else if SubmitInfo.sizeXS{
            sizeLabel.text = "XS"
        }
        else if SubmitInfo.sizeS{
            sizeLabel.text = "S"
        }
        else if SubmitInfo.sizeM{
            sizeLabel.text = "M"
        }
        else if SubmitInfo.sizeL{
            sizeLabel.text = "L"
        }
        else if SubmitInfo.sizeXL{
            sizeLabel.text = "XL"
        }
        else {
            sizeLabel.text = ""
        }
        
        bannerWebIDLabel.text = SubmitInfo.bannerWebID
        userNameLabel.text = SubmitInfo.userName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int{
//        return 1
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentfier: "DressListingCell", for: indexPath) as? DressListingCell else{
//            fatalError("Can't get cell of the right kind")
//        }
//        
//        // Configure the cell...
//
//        let sharedDresses = UserInfo.dressesShared[indexPath.row]
//        print(sharedDresses)
//        cell.configureCell(sharedDresses: sharedDresses)
//
//        return cell
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
