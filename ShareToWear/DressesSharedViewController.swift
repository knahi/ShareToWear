//
//  DressesSharedViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/18/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit

class DressesSharedViewController: UIViewController {
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var prefPriceLabel: UILabel!
    @IBOutlet weak var origPriceLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var bannerWebIDLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var bannerwebID: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int{
//        return 1
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentfier: "DressListingCell", for: indexPath) as? DressListingCell else{
//            fatalError("Can't get cell of the right kind")
//        }
//        
//        // Configure the cell...
//
//        let sharedDresses = UserInfo.dressesShared[indexPath.row]
//        print(sharedDresses)
//        cell.configureCell(sharedDresses: sharedDresses)
//
//        return cell
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
