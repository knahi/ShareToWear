//
//  RentedViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 5/8/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit
import Firebase
class RentedViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
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
        getShared(Email: email.text!)
    }
    
    func getShared (Email:String) -> Void{
        //Database setup
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        
        ref.child("rentals").observeSingleEvent(of: .value, with: {(snapshot) in
            
            let rentalCollection = snapshot.value as? NSDictionary
            let yPos: Int = 150
            let xPos: Int = 200
            let height: Int = 21
            let width: Int = 250
            var iter: Int = 0
            for item in rentalCollection!{
                let rentedDress = item.value as? NSDictionary
                let emailAddress = rentedDress?["renterEmail"] as! String
                if (Email == emailAddress){
                    print(item)
                    let firstLabelPos = yPos+(height*iter)
                    //dress label
                    let dressLabel = UILabel(frame: CGRect(x: 10, y: 10, width: width, height: height))
                    dressLabel.center = CGPoint(x: xPos, y:firstLabelPos )
                    dressLabel.textAlignment = .left
                    dressLabel.text = "Dress: " + (rentedDress?["dressName"] as! String)
                    dressLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
                    self.view.addSubview(dressLabel)
                    //name label
                    let nameLabel = UILabel(frame: CGRect(x:10, y:10, width: width, height: height))
                    nameLabel.center = CGPoint(x: xPos, y: firstLabelPos+height)
                    nameLabel.textAlignment = .left
                    nameLabel.text = "Name: " + (rentedDress?["renterName"] as! String)
                    self.view.addSubview(nameLabel)
                    //email label
                    let emailLabel = UILabel(frame: CGRect(x:10, y:10, width: width, height: height))
                    emailLabel.center = CGPoint(x: xPos, y: firstLabelPos+(2*height))
                    emailLabel.textAlignment = .left
                    emailLabel.text = "Email: "+emailAddress
                    self.view.addSubview(emailLabel)
                    //delivery label
                    let deliveryLabel = UILabel(frame: CGRect(x:10, y:10, width: width, height: height))
                    deliveryLabel.center = CGPoint(x: xPos, y: firstLabelPos+(3*height))
                    deliveryLabel.textAlignment = .left
                    deliveryLabel.text = "Delivery Method: "+(rentedDress?["deliveryMethod"] as! String)
                    self.view.addSubview(deliveryLabel)
                    //building label
                    let buildingLabel = UILabel(frame: CGRect(x:10, y:10, width: width, height: height))
                    buildingLabel.center = CGPoint(x: xPos, y: firstLabelPos+(4*height))
                    buildingLabel.textAlignment = .left
                    buildingLabel.text = "Building: "+(rentedDress?["building"] as! String)
                    self.view.addSubview(buildingLabel)
                    //room number label
                    let roomNumLabel = UILabel(frame: CGRect(x:10, y:10, width: width, height: height))
                    roomNumLabel.center = CGPoint(x: xPos, y: firstLabelPos+(5*height))
                    roomNumLabel.textAlignment = .left
                    roomNumLabel.text = "Room Number: "+(rentedDress?["roomNumber"] as! String)
                    self.view.addSubview(roomNumLabel)
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
        // Pass the selected object to the new view controller.
    }
    */

}
