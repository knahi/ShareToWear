//
//  RentDressViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/26/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit
import Firebase

class RentDressViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pickUP: UISwitch!
    @IBOutlet weak var DropOff: UISwitch!

    @IBAction func submitPressed(_ sender: UIButton) {

        
        //FIREBASE SUBMISSION
        var ref: FIRDatabaseReference
        ref = FIRDatabase.database().reference()
        var method: String = ""
        if pickUP.isOn{
            method = "Pick Up"
        }else{
            method = "Drop-off"
        }
        let rentedDress = RentInfo(renterName: name.text!, renterEmail: email.text!, deliveryMethod: method, dressName: FavModel.currentSelection, building: FavModel.building, roomNumber: FavModel.roomNum)
        let rentedDressRef = ref.child("rentals").child(FavModel.currentSelection)
        rentedDressRef.setValue(rentedDress.toAnyObject())
        
//        let submitItem = SubmitInfo(type: dressType, dressTitle: dressTitle.text!, userName: userName.text!, bannerWebID: bannerWebID.text!, brand: brand.text!, originalPrice: originalPrice.text!, preferredPrice: preferredPrice.text!, size: getSize(), color: getColorArray())
//        
//        let submitItemRef = ref.child("users").child(bannerWebID.text!+"_"+dressTitle.text!)
//        submitItemRef.setValue(submitItem.toAnyObject())
    }
    //present view controller programmatically not working
//    @IBAction func dropOffSwitch(_ sender: Any) {
//        let modalVC = DropOffViewController()
//        present(modalVC, animated: true, completion: nil)
//        
//    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // I added a Tap Gesture Recognizer to the view
    // this action is fired by tapping on the view
    // the effect is that when the keyboard is showing, tapping outside of the keyboard makes it go away
    @IBAction func tapToDismissKeyboard(_ sender: UITapGestureRecognizer) {
        name.resignFirstResponder() //hide the keyboard
        email.resignFirstResponder()    //hide the keyboard
        
    }
    
    // This is a delegate method
    // The text field will call this when the done/return/etc button is typed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //hide the keyboard
        return true
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
