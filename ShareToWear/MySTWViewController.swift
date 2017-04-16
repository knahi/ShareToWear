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
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard let destinationvc = segue.destination as?
            AboutViewController else{
            fatalError("Connecting to the wrong type of view controller")
            }

        guard let identifier = segue.identifier else{
            fatalError("Segue had no identifier")
        }
    }

}
