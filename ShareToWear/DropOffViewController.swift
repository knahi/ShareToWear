//
//  DropOffViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/26/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class DropOffViewController: UIViewController {

    
    @IBOutlet weak var building: UITextField!
    @IBOutlet weak var roomNum: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        SubmitInfo.building = building.text!
        SubmitInfo.roomNum = roomNum.text!
        
        if presentingViewController is UITabBarController{
            dismiss(animated: true, completion: nil)
        }else if let owningNavController =
            navigationController{
            owningNavController.popViewController(animated: true)
        }else{
            fatalError("View is not contained by a navigation controller")
        }
    }
    
    // I added a Tap Gesture Recognizer to the view
    // this action is fired by tapping on the view
    // the effect is that when the keyboard is showing, tapping outside of the keyboard makes it go away
    @IBAction func tapToDismissKeyboard(_ sender: UITapGestureRecognizer) {
        building.resignFirstResponder() //hide the keyboard
        roomNum.resignFirstResponder()    //hide the keyboard
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
