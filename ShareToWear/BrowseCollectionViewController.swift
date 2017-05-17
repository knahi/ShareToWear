//
//  BrowseCollectionViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 5/3/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//
//  handles the display of dresses in the browse view
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"

class BrowseCollectionViewController: UICollectionViewController{

    var count: Int = 0
   
    //gets the number of dresses to be displayed in the collection view (according
    //to filter values)
    func getCount() -> Void {

        //Database setup
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        
        self.count = 0
        FavModel.allDresses = [String]()
        ref.child("dresses").observeSingleEvent(of: .value, with: { (snapshot) in
            let collection = snapshot.value as? NSDictionary
            
            for item in collection!{
                var itemSelected:Bool = true
                let dress = item.value as? NSDictionary
                
                //Filters for price
                let price = dress?["price"] as! Int
                if (price <= FilterModel.price){
                    itemSelected = true
                }else{
                    itemSelected = false
                }
                //Filters for availability
                if (itemSelected && FilterModel.availability){
                    let available = dress?["availability"] as! String
                    if available == "true"{
                            itemSelected = true
                    }else{
                        itemSelected = false
                    }
                }
                //Filters for size
                let sizeArray = self.getSizeArray()
                if(itemSelected && !sizeArray.isEmpty){
                    for size in sizeArray{
                        let dressSize = dress?["size"] as! String
                        if dressSize == size{
                            itemSelected = true
                            break
                        }else{
                            itemSelected = false
                        }
                    }
                }
           
                //Filters for color
                let colorArray = self.getColorArray()
                if(itemSelected && !colorArray.isEmpty){
                    for color in colorArray{
                        let dressColor = dress?["color"] as! String
                        if dressColor == color{
                            itemSelected = true
                            break
                        }else{
                            itemSelected = false
                        }
                    }
                }
                
                if itemSelected{
                    self.count += 1
                    FavModel.allDresses.append(item.key as! String)
                }
            } //end of for loop
            
            // takes care of firebase asynchronicity
            DispatchQueue.main.async{self.collectionView?.reloadData()}
        })
    }
    //returns an array of all sizes filtered for
    func getSizeArray() -> [String]{
        var sizeArray = [String] ()
        if FilterModel.size0{
            sizeArray.append("0")
        }
        if FilterModel.size2{
            sizeArray.append("2")
        }
        if FilterModel.size4{
            sizeArray.append("4")
        }
        if FilterModel.size6{
            sizeArray.append("6")
        }
        if FilterModel.size8{
            sizeArray.append("8")
        }
        if FilterModel.size10{
            sizeArray.append("10")
        }
        if FilterModel.size12{
            sizeArray.append("12")
        }
        if FilterModel.size14{
            sizeArray.append("14")
        }
        if FilterModel.sizeS{
            sizeArray.append("S")
        }
        if FilterModel.sizeXS{
            sizeArray.append("XS")
        }
        if FilterModel.sizeM{
            sizeArray.append("M")
        }
        if FilterModel.sizeL{
            sizeArray.append("L")
        }
        if FilterModel.sizeXL{
            sizeArray.append("XL")
        }
        return sizeArray
    }
    // returns an array of all colors filtered for
    func getColorArray() -> [String]{
        var colorArray = [String]()
        if FilterModel.black{
            colorArray.append("BLACK")
        }
        if FilterModel.blue{
            colorArray.append("BLUE")
        }
        if FilterModel.gray{
            colorArray.append("GRAY")
        }
        if FilterModel.green{
            colorArray.append("GREEN")
        }
        if FilterModel.multicolor{
            colorArray.append("MULTICOLOR")
        }
        if FilterModel.orange{
            colorArray.append("ORANGE")
        }
        if FilterModel.pink{
            colorArray.append("PINK")
        }
        if FilterModel.purple{
            colorArray.append("PURPLE")
        }
        if FilterModel.red{
            colorArray.append("RED")
        }
        if FilterModel.white{
            colorArray.append("WHITE")
        }
        if FilterModel.yellow{
            colorArray.append("YELLOW")
        }
        return colorArray
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getCount()
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
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("in collection view cell num function")
        return self.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DressCellCollection", for: indexPath) as? DressCellCollectionViewCell else{
            fatalError("Can't get cell of the right kind")
        }
    
        // Configure the cell
        cell.backgroundColor = UIColor.black
        
        let dressName = String(FavModel.allDresses[indexPath.row]) + ".JPG"
        
        //add dress image to cell
        if (UIImage(named: dressName) != nil) {
            cell.configureCell(UIImage(named: dressName)!)
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    //handles click event on collection view cell (dress image)
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //passing the dress information
        FavModel.currentSelection = FavModel.allDresses[indexPath.item]
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "DressInfo")
        self.show(vc as! UIViewController, sender: vc)
    }

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
