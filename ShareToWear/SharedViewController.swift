//
//  SharedViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 5/8/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit
import Firebase

class SharedViewController: UIViewController {


    @IBOutlet weak var bannerWebID: UITextField!
    @IBOutlet weak var submit: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func submitted(_ sender: UIButton) {
        let id = bannerWebID.text!
        
        getShared(ID: id)
    }
    
    func getShared (ID:String) -> Void{
        //Database setup
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        
        ref.child("users").observeSingleEvent(of: .value, with: {(snapshot) in
        
            let userCollection = snapshot.value as? NSDictionary
            let yPos: Int = 150
            let xPos: Int = 100
            let height: Int = 21
            let width: Int = 200
            var iter: Int = 0
            for item in userCollection!{
                let dressSubmission = item.value as? NSDictionary
                let bannerwebID = dressSubmission?["bannerWebID"] as! String
                if (ID == bannerwebID){
                    print(item)
                    let firstLabelPos = yPos+(height*iter)
                    //title label
                    let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
                    titleLabel.center = CGPoint(x: xPos, y:firstLabelPos )
                    titleLabel.textAlignment = .left
                    titleLabel.text = "Dress: " + (dressSubmission?["dressTitle"] as! String)
                    titleLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
                    self.view.addSubview(titleLabel)
                    //brand label
                    let brandLabel = UILabel(frame: CGRect(x:0, y:0, width: width, height: height))
                    brandLabel.center = CGPoint(x: xPos, y: firstLabelPos+height)
                    brandLabel.textAlignment = .left
                    brandLabel.text = "Brand: " + (dressSubmission?["brand"] as! String)
                    self.view.addSubview(brandLabel)
                    //submission type label
                    let typeLabel = UILabel(frame: CGRect(x:0, y:0, width: width, height: height))
                    typeLabel.center = CGPoint(x: xPos, y: firstLabelPos+(2*height))
                    typeLabel.textAlignment = .left
                    typeLabel.text = "Submission Type: "+(dressSubmission?["type"] as! String)
                    self.view.addSubview(typeLabel)
                    //size label
                    let sizeLabel = UILabel(frame: CGRect(x:0, y:0, width: width, height: height))
                    sizeLabel.center = CGPoint(x: xPos, y: firstLabelPos+(3*height))
                    sizeLabel.textAlignment = .left
                    sizeLabel.text = "Size: "+(dressSubmission?["size"] as! String)
                    self.view.addSubview(sizeLabel)
                    //original price label
                    let opLabel = UILabel(frame: CGRect(x:0, y:0, width: width, height: height))
                    opLabel.center = CGPoint(x: xPos, y: firstLabelPos+(4*height))
                    opLabel.textAlignment = .left
                    opLabel.text = "Original Price: "+(dressSubmission?["originalPrice"] as! String)
                    self.view.addSubview(opLabel)
                    //preferred price label
                    let ppLabel = UILabel(frame: CGRect(x:0, y:0, width: width, height: height))
                    ppLabel.center = CGPoint(x: xPos, y: firstLabelPos+(5*height))
                    ppLabel.textAlignment = .left
                    ppLabel.text = "Original Price: "+(dressSubmission?["preferredPrice"] as! String)
                    self.view.addSubview(ppLabel)
                }
                iter += 7
            }
        
        
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view contr7ller.
    }
    */

}
