//
//  HomeViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/26/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//
// Handles navigation from home page to share and wear pages
// configures Firebase

import UIKit
import Firebase


class HomeViewController: UIViewController {

    @IBOutlet weak var wear: UIButton!
    @IBOutlet weak var share: UIButton!
    
    @IBAction func wearPressed(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
   
    override func viewDidAppear(_ animated: Bool) {
        
        // adds share to wear logo to navigation bar
        let image = UIImage(named: "titleLogo.png")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use Firebase library to configure APIs
        FIRApp.configure()

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
