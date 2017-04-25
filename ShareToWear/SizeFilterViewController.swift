//
//  SizeFilterViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/24/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class SizeFilterViewController: UIViewController {
    
    //var filters:FilterModel = FilterModel()
    
    

    @IBOutlet weak var doneButton: UIBarButtonItem!
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
    
    //UPDATE MODEL VALUES
    @IBAction func sizeFilterUpdate(_ sender: UISwitch) {
        FilterModel.size2 = size2.isOn
        FilterModel.size4 = size4.isOn
        FilterModel.size6 = size6.isOn
        FilterModel.size8 = size8.isOn
        FilterModel.size10 = size10.isOn
        FilterModel.size12 = size12.isOn
        FilterModel.size14 = size14.isOn
        FilterModel.sizeXS = sizeXS.isOn
        FilterModel.sizeS = sizeS.isOn
        FilterModel.sizeM = sizeM.isOn
        FilterModel.sizeL = sizeL.isOn
        FilterModel.sizeXL = sizeXL.isOn
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        size2.isOn = FilterModel.size2
        size4.isOn = FilterModel.size4
        size6.isOn = FilterModel.size6
        size8.isOn = FilterModel.size8
        size10.isOn = FilterModel.size10
        size12.isOn = FilterModel.size12
        size14.isOn = FilterModel.size14
        sizeXS.isOn = FilterModel.sizeXS
        sizeS.isOn = FilterModel.sizeS
        sizeM.isOn = FilterModel.sizeM
        sizeL.isOn = FilterModel.sizeL
        sizeXL.isOn = FilterModel.sizeXL
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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
