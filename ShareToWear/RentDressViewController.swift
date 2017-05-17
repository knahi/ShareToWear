//
//  RentDressViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/26/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//
// handles input to the dress rental form
//

import UIKit
import Firebase

class RentDressViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pickUP: UISwitch!
    @IBOutlet weak var DropOff: UISwitch!

    // adds data to firebase when submit button pressed
    @IBAction func submitPressed(_ sender: UIButton) {
        FavModel.renterEmail = email.text!
        FavModel.renterName = name.text!
        
        //FIREBASE SUBMISSION
        var ref: FIRDatabaseReference
        ref = FIRDatabase.database().reference()
        if pickUP.isOn{
            FavModel.method = "Pick Up"
        }else{
            FavModel.method = "Drop-off"
        }
        let rentedDress = RentInfo(renterName: name.text!, renterEmail: email.text!, deliveryMethod: FavModel.method, dressName: FavModel.currentSelection, building: FavModel.building, roomNumber: FavModel.roomNum, date: FavModel.date)
        let rentedDressRef = ref.child("rentals").child(FavModel.currentSelection)
        rentedDressRef.setValue(rentedDress.toAnyObject())

        let dressRef = ref.child("dresses").child(FavModel.currentSelection).child("availability")
        dressRef.setValue("false")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // hides keyboard when screen tapped
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
