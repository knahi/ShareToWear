//
//  MySTWViewController.swift
//  ShareToWear
//
//  Created by Kayla Nahi on 4/16/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class MySTWViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        // adds share to wear logo to navigation bar
        let image = UIImage(named: "titleLogo.png")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
//        guard let destinationvc = segue.destination as?
//            AboutViewController else{
//            fatalError("Connecting to the wrong type of view controller")
//            }
//
//        guard let identifier = segue.identifier else{
//            fatalError("Segue had no identifier")
//        }
    }

}
