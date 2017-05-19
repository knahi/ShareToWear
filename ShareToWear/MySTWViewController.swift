//
//  MySTWViewController.swift
//  ShareToWear
//
//  Created by Kayla Nahi on 4/16/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

//Home page view controller

class MySTWViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidAppear(_ animated: Bool) {
        
        // adds share to wear logo to navigation bar
        let image = UIImage(named: "titleLogo.png")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
