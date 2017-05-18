//
//  HeartsCollectionViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 5/2/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//
// handles the display of dresses in the "hearts" views

import Firebase
import UIKit

private let reuseIdentifier = "DressCell"


class HeartsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidAppear(_ animated: Bool) {
       self.collectionView?.reloadData()

        // adds share to wear logo to navigation bar
        let image = UIImage(named: "titleLogo.png")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
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
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FavModel.favorites.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeartsCell", for: indexPath) as? HeartsCollectionViewCell else{
            fatalError("Can't get cell of the right kind")
        }
        cell.backgroundColor = UIColor.white
    
        // Configure the cell
        
        let dressName = String(FavModel.favorites[indexPath.row]) + ".JPG"
        
        // adds dress image to cell
        if (UIImage(named: dressName) != nil) {
            cell.configureCell(UIImage(named: dressName)!)
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    // handles click event on collection view cell (dress)
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        FavModel.currentSelection = FavModel.favorites[indexPath.item]
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "DressInfo")
        self.show(vc as! UIViewController, sender: vc)
        return true
    }
 

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
