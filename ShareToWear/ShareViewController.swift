//
//  ShareViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/26/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit
import Firebase

class ShareViewController: UIViewController {
    
    @IBOutlet weak var rental: UISwitch!
    @IBOutlet weak var sale: UISwitch!
    @IBOutlet weak var dressTitle: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var white: UISwitch!
    @IBOutlet weak var bannerWebID: UITextField!
    
    @IBOutlet weak var blue: UISwitch!
    @IBOutlet weak var yellow: UISwitch!
    @IBOutlet weak var pink: UISwitch!
    @IBOutlet weak var red: UISwitch!
    @IBOutlet weak var multicolor: UISwitch!
    @IBOutlet weak var black: UISwitch!
    @IBOutlet weak var green: UISwitch!
    @IBOutlet weak var orange: UISwitch!
    @IBOutlet weak var purple: UISwitch!
    @IBOutlet weak var gray: UISwitch!
    
    @IBOutlet weak var size0: UISwitch!
    @IBOutlet weak var size2: UISwitch!
    @IBOutlet weak var size4: UISwitch!
    @IBOutlet weak var size6: UISwitch!
    @IBOutlet weak var size8: UISwitch!
    @IBOutlet weak var size10: UISwitch!
    @IBOutlet weak var size12: UISwitch!
    @IBOutlet weak var size14: UISwitch!
    @IBOutlet weak var sizeXS: UISwitch!
    @IBOutlet weak var sizeS: UISwitch!
    @IBOutlet weak var sizeM: UISwitch!
    @IBOutlet weak var sizeL: UISwitch!
    @IBOutlet weak var sizeXL: UISwitch!
    
    @IBOutlet weak var brand: UITextField!
    @IBOutlet weak var originalPrice: UITextField!
    @IBOutlet weak var preferredPrice: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func submitPressed(_ sender: UIButton) {
        DressReview.blue = blue.isOn
        DressReview.white = white.isOn
        DressReview.yellow = yellow.isOn
        DressReview.pink = pink.isOn
        DressReview.red = red.isOn
        DressReview.multicolor = multicolor.isOn
        DressReview.black = black.isOn
        DressReview.green = green.isOn
        DressReview.orange = orange.isOn
        DressReview.purple = purple.isOn
        DressReview.gray = gray.isOn
        
        DressReview.size0 = size0.isOn
        DressReview.size2 = size2.isOn
        DressReview.size4 = size4.isOn
        DressReview.size6 = size6.isOn
        DressReview.size8 = size8.isOn
        DressReview.size10 = size10.isOn
        DressReview.size12 = size12.isOn
        DressReview.size14 = size14.isOn
        DressReview.sizeXS = sizeXS.isOn
        DressReview.sizeS = sizeS.isOn
        DressReview.sizeM = sizeM.isOn
        DressReview.sizeL = sizeL.isOn
        DressReview.sizeXL = sizeXL.isOn
        
        if rental.isOn{
            DressReview.type = "Rental"
        }else if sale.isOn{
            DressReview.type = "Sale"
        }
        
        DressReview.dressTitle = dressTitle.text!
        DressReview.userName = userName.text!
        DressReview.bannerWebID = bannerWebID.text!
        DressReview.brand = brand.text!
        DressReview.originalPrice = originalPrice.text!
        DressReview.preferredPrice = preferredPrice.text!
        
        var dressType: String = ""
        if rental.isOn{
            dressType = "rental"
        }else if sale.isOn{
            dressType = "sale"
        }

        //FIREBASE SUBMISSION
        var ref: FIRDatabaseReference
        ref = FIRDatabase.database().reference()
        
        let submitItem = SubmitInfo(type: dressType, dressTitle: dressTitle.text!, userName: userName.text!, bannerWebID: bannerWebID.text!, brand: brand.text!, originalPrice: originalPrice.text!, preferredPrice: preferredPrice.text!, size: getSize(), color: getColorArray())
        
        let submitItemRef = ref.child("users").child(bannerWebID.text!+"_"+dressTitle.text!)
        submitItemRef.setValue(submitItem.toAnyObject())
    }
    func getColorArray() -> [String]{
        var colorArray = [String]()
        if black.isOn{
            colorArray.append("BLACK")
        }
        if blue.isOn{
            colorArray.append("BLUE")
        }
        if gray.isOn{
            colorArray.append("GRAY")
        }
        if green.isOn{
            colorArray.append("GREEN")
        }
        if multicolor.isOn{
            colorArray.append("MULTICOLOR")
        }
        if orange.isOn{
            colorArray.append("ORANGE")
        }
        if pink.isOn{
            colorArray.append("PINK")
        }
        if purple.isOn{
            colorArray.append("PURPLE")
        }
        if red.isOn{
            colorArray.append("RED")
        }
        if white.isOn{
            colorArray.append("WHITE")
        }
        if yellow.isOn{
            colorArray.append("YELLOW")
        }
        return colorArray
    }
    func getSize() -> String{
        var size:String
        if size0.isOn{
            size = "0"
        }else if size2.isOn{
            size = "2"
        }else if size4.isOn{
            size = "4"
        }else if size6.isOn{
            size = "6"
        }else if size8.isOn{
            size = "8"
        }else if size10.isOn{
            size = "10"
        }else if size12.isOn{
            size = "12"
        }else if size14.isOn{
            size = "14"
        }else if sizeS.isOn{
            size = "S"
        }else if sizeXS.isOn{
            size = "XS"
        }else if sizeM.isOn{
            size = "M"
        }else if sizeL.isOn{
            size = "L"
        }else{
            size = "XL"
        }
        return size
    }
    
    // When the keyboard is showing, tapping outside of the keyboard makes it go away
    @IBAction func tapToDismissKeyboard(_ sender: UITapGestureRecognizer) {
        dressTitle.resignFirstResponder() //hide the keyboard
        userName.resignFirstResponder()    //hide the keyboard
        bannerWebID.resignFirstResponder()    //hide the keyboard
        brand.resignFirstResponder()    //hide the keyboard
        originalPrice.resignFirstResponder()    //hide the keyboard
        preferredPrice.resignFirstResponder()    //hide the keyboard

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
