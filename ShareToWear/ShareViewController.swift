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
        // Use Firebase library to configure APIs
        FIRApp.configure()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitPressed(_ sender: UIButton) {
        
        var dressType: String = ""
//        SubmitInfo.blue = blue.isOn
//        SubmitInfo.white = white.isOn
//        SubmitInfo.yellow = yellow.isOn
//        SubmitInfo.pink = pink.isOn
//        SubmitInfo.red = red.isOn
//        SubmitInfo.multicolor = multicolor.isOn
//        SubmitInfo.black = black.isOn
//        SubmitInfo.green = green.isOn
//        SubmitInfo.orange = orange.isOn
//        SubmitInfo.purple = purple.isOn
//        SubmitInfo.gray = gray.isOn
//        
//        SubmitInfo.size0 = size0.isOn
//        SubmitInfo.size2 = size2.isOn
//        SubmitInfo.size4 = size4.isOn
//        SubmitInfo.size6 = size6.isOn
//        SubmitInfo.size8 = size8.isOn
//        SubmitInfo.size10 = size10.isOn
//        SubmitInfo.size12 = size12.isOn
//        SubmitInfo.size14 = size14.isOn
//        SubmitInfo.sizeXS = sizeXS.isOn
//        SubmitInfo.sizeS = sizeS.isOn
//        SubmitInfo.sizeM = sizeM.isOn
//        SubmitInfo.sizeL = sizeL.isOn
//        SubmitInfo.sizeXL = sizeXL.isOn
//        
        if rental.isOn{
            dressType = "rental"
        }else if sale.isOn{
            dressType = "sale"
        }
//
//        SubmitInfo.dressTitle = dressTitle.text!
//        
//        SubmitInfo.userName = userName.text!
//        
//        SubmitInfo.bannerWebID = bannerWebID.text!
//        
//        SubmitInfo.brand = brand.text!
//        
//        SubmitInfo.originalPrice = originalPrice.text!
//        
//        SubmitInfo.preferredPrice = preferredPrice.text!
        
        //FIREBASE SUBMISSION
        var ref: FIRDatabaseReference
        ref = FIRDatabase.database().reference()
        
        let submitItem = SubmitInfo(type: dressType, dressTitle: dressTitle.text!, userName: userName.text!, bannerWebID: bannerWebID.text!, brand: brand.text!, originalPrice: originalPrice.text!, preferredPrice: preferredPrice.text!, size: getSize(), color: getColorArray())
        
        let submitItemRef = ref.child("users").child(bannerWebID.text!)
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
    
    // I added a Tap Gesture Recognizer to the view
    // this action is fired by tapping on the view
    // the effect is that when the keyboard is showing, tapping outside of the keyboard makes it go away
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
