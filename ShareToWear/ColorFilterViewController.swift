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
    @IBOutlet weak var multicolor: UISwitch!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    
    @IBAction func colorFilterUpdate(_ sender: UISwitch) {
        FilterModel.white = white.isOn
        FilterModel.blue = blue.isOn
        FilterModel.yellow = yellow.isOn
        FilterModel.pink = pink.isOn
        FilterModel.red = red.isOn
        FilterModel.black = black.isOn
        FilterModel.green = green.isOn
        FilterModel.orange = orange.isOn
        FilterModel.purple = purple.isOn
        FilterModel.gray = gray.isOn
        FilterModel.multicolor = multicolor.isOn
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        white.isOn = FilterModel.white
        blue.isOn = FilterModel.blue
        yellow.isOn = FilterModel.yellow
        pink.isOn = FilterModel.pink
        red.isOn = FilterModel.red
        black.isOn = FilterModel.black
        green.isOn = FilterModel.green
        orange.isOn = FilterModel.orange
        purple.isOn = FilterModel.purple
        gray.isOn = FilterModel.gray
        multicolor.isOn = FilterModel.multicolor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func done(_ sender: UIBarButtonItem) {
        if presentingViewController is UITabBarController{
            dismiss(animated: true, completion: nil)
        }else if let owningNavController = navigationController{
            owningNavController.popViewController(animated: true)
        }else{
            fatalError("view is not contained by a navigation controller")
        }
        
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
