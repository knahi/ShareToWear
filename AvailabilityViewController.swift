//
//  AvailabilityViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/25/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class AvailabilityViewController: UIViewController {
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var availability: UISwitch!

    @IBAction func availabilityUpdate(_ sender: UISwitch) {
        FilterModel.availability = availability.isOn
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        availability.isOn = FilterModel.availability

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if presentingViewController is UITabBarController{
            dismiss(animated: true, completion: nil)
        }else if let owningNavController = navigationController{
            owningNavController.popViewController(animated: true)
        }else{
            fatalError("view is not contained by a navigation controller")
        }
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
