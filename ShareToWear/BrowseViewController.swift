////
////  BrowseViewController.swift
////  ShareToWear
////
////  Created by Lily Taub on 4/24/17.
////  Copyright © 2017 Kayla Nahi. All rights reserved.
////
//
//  THIS FILE IS WHERE WE ID THE STORAGE WORK, WILL USE WHEN WE
//  UPDATE OUR ACCOUNT.
//
//import UIKit
//import Firebase
//import SDWebImage
//
//
//
//class BrowseViewController: UIViewController {
//    
//    private var filter: FilterModel = FilterModel()
//    @IBOutlet weak var blackDress: UIButton!
//    @IBOutlet weak var redDress: UIButton!
//    @IBOutlet weak var viewControl: UIImageView!
//    
//    @IBAction func blackDress(_ sender: UIButton) {
//        DressButton.myButtonPressed = "black"
//    }
//    @IBAction func redDress(_ sender: UIButton) {
//        DressButton.myButtonPressed = "red"
//    }
//    @IBAction func blueDress(_ sender: UIButton) {
//        DressButton.myButtonPressed = "blue"
//    }
//    
//    @IBAction func yellowDress(_ sender: UIButton) {
//        DressButton.myButtonPressed = "yellow"
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Use Firebase library to configure APIs
//        FIRApp.configure()
//        
//        //Database setup
//        var ref: FIRDatabaseReference!
//        ref = FIRDatabase.database().reference()
//        
//        
//        //
//        // Get a reference to the storage service using the Firebase App
//        let storage = FIRStorage.storage()
//        
//        //Create a storage reference from the storage service
//        let storageRef = storage.reference()
//        
//        // Reference to an image file in Firebase Storage
//        let reference = storageRef.child("DressImages/IMG_2379.jpg")
//        
//        // Fetch the download URL
//        reference.downloadURL { url, error in
//            if let error = error {
//                // Handle any errors
//            } else {
//                // Get the download URL for 'images/stars.jpg'
//            }
//        }
//    
//        // UIImageView in your ViewController
//        let imageView: UIImageView = self.viewControl
//        
//        // Placeholder image
//        let placeholderImage = UIImage(named: "dress1.jpg")
//        
////      let storageRef = FIRStorage.storage().reference(forURL: "gs://sharetowear-1f221.appspot.com")
//
//        
//        let photoURL = URL(string:"gs://sharetowear-1f221.appspot.com/DressImages/IMG_2379.jpg")
//        
//        // Load the image using SDWebImage
//        imageView.sd_setImage(with: photoURL, placeholderImage: placeholderImage)
//    }
//    
//    override func viewDidAppear(_ animated: Bool){
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//}
