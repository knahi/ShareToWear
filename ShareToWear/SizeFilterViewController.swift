//
//  SizeFilterViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/24/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class SizeFilterViewController: UIViewController {
    
    
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
    
    
    @IBAction func size2OnOff(_ sender: UISwitch) {
        //set universal state of size2 filter
        UserDefaults.standard.set(sender.isOn, forKey: "switch2State")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //makes size2 filter value persist when view is reloaded
        size2.isOn = UserDefaults.standard.bool(forKey: "switch2State")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if presentingViewController is UITabBarController{
            dismiss(animated: true, completion: nil)
        }else if let owningNavController =
            navigationController{
            owningNavController.popViewController(animated: true)
        }else{
            fatalError("View is not contained by a navigation controller")
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
