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
    @IBAction func size2Update(_ sender: UISwitch) {
        FilterModel.size2 = size2.isOn
    }
    @IBAction func size4Update(_ sender: UISwitch) {
        FilterModel.size4 = size4.isOn
    }
    @IBAction func size8Update(_ sender: UISwitch) {
        FilterModel.size8 = size8.isOn
    }
    @IBAction func size6Update(_ sender: UISwitch) {
        FilterModel.size6 = size6.isOn
    }
    @IBAction func size10Update(_ sender: UISwitch) {
        FilterModel.size10 = size10.isOn
    }
    @IBAction func size12Update(_ sender: UISwitch) {
        FilterModel.size12 = size12.isOn
    }
    @IBAction func size14Update(_ sender: UISwitch) {
        FilterModel.size14 = size14.isOn
    }
    @IBAction func sizeXSUpdate(_ sender: UISwitch) {
        FilterModel.sizeXS = sizeXS.isOn
    }
    @IBAction func sizeSUpdate(_ sender: UISwitch) {
        FilterModel.sizeS = sizeS.isOn
    }
    @IBAction func sizeMUpdate(_ sender: UISwitch) {
        FilterModel.sizeM = sizeM.isOn
    }
    @IBAction func sizeLUpdate(_ sender: UISwitch) {
        FilterModel.sizeL = sizeL.isOn
    }
    @IBAction func sizeXLUpdate(_ sender: UISwitch) {
        FilterModel.sizeXL = sizeXL.isOn
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
