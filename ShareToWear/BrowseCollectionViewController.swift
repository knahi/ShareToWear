//
//  BrowseCollectionViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 5/3/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"

class BrowseCollectionViewController: UICollectionViewController {
    
    var count: Int = 0
   

    func getCount() -> Void {

        //Database setup
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        
        ref.child("dresses").observeSingleEvent(of: .value, with: { (snapshot) in
            let collection = snapshot.value as? NSDictionary
            
            for item in collection!{
                //self.count += 1
                let dress = item.value as? NSDictionary
                if FilterModel.availability{
                    let available = dress?["availability"]
                    if (available != nil){
                        print("available")
                    }else{
                        print("nothing here")
                    }
                }else{
                    print("availability filter off")
                    self.count += 1
                }
            } //end of for loop
            
//            for item in snapshot.children{
//                //NEXT STEP: FILTERING
//                print(item)
//                let dress = item as? NSDictionary
//                print(dress)
//                self.count += 1
//                
//                
//            }
            print("getting database info...")
            print(self.count)
            DispatchQueue.main.async{self.collectionView?.reloadData()}
            
            
        })
    }
    //NOT TRIGGERING WHEN MODAL VIEW DISSAPPEARS
    override func viewDidLoad() {
        // Use Firebase library to configure APIs
        FIRApp.configure()
        
        super.viewDidLoad()
        getCount()
        
        // Get a reference to the storage service using the default Firebase App
        let storage = FIRStorage.storage()
        
        // Create a storage reference from our storage service
        let storageRef = storage.reference()
        
        // Create a reference to the file you want to download
        let dressRef = storageRef.child("DressImages/dress81.JPG")
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        dressRef.data(withMaxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                print("Image is too big")
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                //self.viewControl.image = image
            }
        }
        

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
