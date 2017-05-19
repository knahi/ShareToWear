//
//  AboutViewController.swift
//  ShareToWear
//
//  Created by Kayla Nahi on 4/16/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

//View controller for the about page.
class AboutViewController: UIViewController {
    @IBOutlet weak var aboutLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if presentingViewController is UITabBarController{
            dismiss(animated: true, completion: nil)
        }else if let owningNavController = navigationController{
            owningNavController.popViewController(animated: true)
        }else{
            fatalError("View is not contained by a navigation controller")
        }
    }


}
