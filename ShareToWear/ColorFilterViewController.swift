//
//  ColorFilterViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/25/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class ColorFilterViewController: UIViewController {
    
    @IBOutlet weak var white: UISwitch!
    @IBOutlet weak var blue: UISwitch!
    @IBOutlet weak var yellow: UISwitch!
    @IBOutlet weak var pink: UISwitch!
    @IBOutlet weak var red: UISwitch!
    @IBOutlet weak var black: UISwitch!
    @IBOutlet weak var green: UISwitch!
    @IBOutlet weak var orange: UISwitch!
    @IBOutlet weak var purple: UISwitch!
    @IBOutlet weak var gray: UISwitch!
    
    @IBAction func whiteOnOff(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "whiteSwitchState")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        white.isOn = UserDefaults.standard.bool(forKey: "whiteSwitchState")

        // Do any additional setup after loading the view.
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
