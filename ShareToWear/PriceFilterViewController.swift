//
//  PriceFilterViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/25/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

//View conroller for the price filter

class PriceFilterViewController: UIViewController {

    @IBOutlet weak var priceSlider: UISlider!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBAction func priceUpdate(_ sender: UISlider) {
        let val = Int(priceSlider.value)
        priceLabel.text = "$" + String(val)
        priceSlider.setValue(Float(val), animated: true)
        FilterModel.price = val
    }
    @IBAction func done(_ sender: UIBarButtonItem) {
        if presentingViewController is UITabBarController{
            dismiss(animated: true, completion: nil)
        }else if let owningNavController = navigationController{
            owningNavController.popViewController(animated: true)
        }else{
            fatalError("View is not contained by a navigation controller");
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceSlider.value = Float(FilterModel.price)
        priceLabel.text = "$"+String(FilterModel.price)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
