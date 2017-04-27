//
//  BrowseViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/24/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {
    
    private var filter: FilterModel = FilterModel()
//    private let dresses = DressCollection()
    @IBOutlet weak var blackDress: UIButton!
    @IBOutlet weak var redDress: UIButton!
    
    @IBAction func blackDress(_ sender: UIButton) {
        DressButton.myButtonPressed = "black"
    }
    @IBAction func redDress(_ sender: UIButton) {
        DressButton.myButtonPressed = "red"
    }
    @IBAction func blueDress(_ sender: UIButton) {
        DressButton.myButtonPressed = "blue"
    }
    
    @IBAction func yellowDress(_ sender: UIButton) {
        DressButton.myButtonPressed = "yellow"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool){
      //apply filters in here
        
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
