//
//  BrowseViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/24/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class BrowseViewController: UIViewController {
    
    
    private var filter: FilterModel = FilterModel()
//    private let dresses = DressCollection()
    @IBOutlet weak var blackDress: UIButton!
    @IBOutlet weak var redDress: UIButton!
    @IBOutlet weak var viewControl: UIImageView!
    
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
        
        // Use Firebase library to configure APIs
        FIRApp.configure()
        
        //Database setup
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        ref.observe(.value, with:{snapshot in
            //var dresses: [DressListing] = []
            for item in snapshot.children{
                //let dress = DressListing(snapshot: item as! FIRDataSnapshot)
                print(item)
                //dresses.append(dress)
            }
            //print(dresses)
        })
        
        
        // Get a reference to the storage service using the Firebase App
        let storage = FIRStorage.storage()
        
        //Create a storage reference from the storage service
        let storageRef = storage.reference()
        
        // Reference to an image file in Firebase Storage
        let reference = storageRef.child("DressImages/IMG_2379.jpg")
        
        // Fetch the download URL
        reference.downloadURL { url, error in
            if let error = error {
                // Handle any errors
            } else {
                // Get the download URL for 'images/stars.jpg'
            }
        }
    
        // UIImageView in your ViewController
        let imageView: UIImageView = self.viewControl
        
        // Placeholder image
        let placeholderImage = UIImage(named: "dress1.jpg")
        
//        let storageRef = FIRStorage.storage().reference(forURL: "gs://sharetowear-1f221.appspot.com")

        
        let photoURL = URL(string:"gs://sharetowear-1f221.appspot.com/DressImages/IMG_2379.jpg")
        
        // Load the image using SDWebImage
        imageView.sd_setImage(with: photoURL, placeholderImage: placeholderImage)
        
        
 //       OLD WAY
//        ref.child("dresses").observeSingleEvent(of: .value, with: { (snapshot) in
//            let collection = snapshot.value as? NSDictionary
//            print(collection?["dress10"] ?? 0)
//            let dress = collection?["dress10"] as? NSDictionary
//            let avail = dress?["available"]
//            let stravail = (avail as! String)
//            print (stravail)
//            
//            
//        }) { (error) in
//            print(error.localizedDescription)
//        }
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
