//
//  DressDetailViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/26/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit
import Firebase

class DressDetailViewController: UIViewController {
    
    private let dresses = DressCollection()
    //var flag = false

    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var dressImage: UIImageView!
    @IBOutlet weak var rentButton: UIButton!
    @IBOutlet weak var notAvailableLabel: UILabel!
    @IBOutlet weak var dressName: UILabel!
    @IBOutlet weak var heartButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorLabel.text = ""
        sizeLabel.text = ""
        priceLabel.text = ""
        brandLabel.text = ""
        dressImage.image = nil
        dressName.text = FavModel.currentSelection
        print(FavModel.favorites.contains(FavModel.currentSelection))
        if(FavModel.favorites.contains(FavModel.currentSelection)){
            print("making heart button")
            heartButton.setImage(UIImage(named: "like.png"), for: .normal)
        }else{
            heartButton.setImage(UIImage(named: "unlike.png"), for: .normal)
        }
        
        getDressDetails()
  
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeImage(_ sender: Any) {
        
        if (!FavModel.favorites.contains(FavModel.currentSelection))
        {
            //for like
            heartButton.setImage(UIImage(named: "like.png"), for: .normal)
            FavModel.favorites.append(FavModel.currentSelection)
            print(FavModel.favorites)
        }
        else
        {
            //for unlike
            heartButton.setImage(UIImage(named: "unlike.png"), for: .normal)
            let updatedFavs = FavModel.favorites.filter{$0 != FavModel.currentSelection}
            FavModel.favorites = updatedFavs
            print(FavModel.favorites)
        }
    }
    func getDressDetails() -> Void {
        
        //Database setup
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        
        ref.child("dresses").child(FavModel.currentSelection).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let dress = snapshot.value as? NSDictionary
            
            let name = String(String(FavModel.currentSelection) + ".JPG")
            self.dressImage.image = UIImage(named: name!)
            
            let color = dress?["color"] as! String
            self.colorLabel.text = color
            let size = dress?["size"] as! String
            self.sizeLabel.text = size
            let price = dress?["price"] as! Int
            self.priceLabel.text = "$ \(price)"
            let brand = dress?["brand"] as! String
            self.brandLabel.text = brand
            let available = dress?["availability"] as! String
            if !(available == "true"){
                self.notAvailableLabel.text = "Sorry, this dress is not available"
                self.rentButton.isHidden = true
            }
            //DispatchQueue.main.async{self.collectionView?.reloadData()}
        
        
            
        })
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
