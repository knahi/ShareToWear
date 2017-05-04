//
//  BrowseCollectionViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 5/3/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

private let reuseIdentifier = "Cell"

class BrowseCollectionViewController: UICollectionViewController {
    var count: Int = 0
   

    func getCount() -> Void {
        // Use Firebase library to configure APIs
        FIRApp.configure()
        //Database setup
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        
        ref.child("dresses").observeSingleEvent(of: .value, with: { (snapshot) in
            for _ in snapshot.children{
                self.count += 1
            }
            print("getting database info...")
            print(self.count)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /* 
         IMAGE STUFF (NOT WORKING VERSION)
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
 
         */
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("in collection view cell num function")
        // #warning Incomplete implementation, return the number of items
        getCount()
        print(self.count)
        return self.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        cell.backgroundColor = UIColor.black
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
