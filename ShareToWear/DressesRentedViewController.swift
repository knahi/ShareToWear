//
//  DressesRentedViewController.swift
//  ShareToWear
//
//  Created by Lily Taub on 4/18/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit
import Firebase

class DressesRentedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var count:Int = 0
    var dressesRented = [RentInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    tableView.dataSource = self as! UITableViewDataSource
    tableView.delegate = self as! UITableViewDelegate

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitted(_ sender: UIButton) {
        let emailAddress = email.text!
        getRented(email: emailAddress)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dressCell", for: indexPath) as? RentedTableViewCell else{
            fatalError("Can't get cell of the right kind")
        }
        
        //Configure the cell
        let dress = dressesRented[indexPath.row]
        cell.configureCell(dress: dress)
        
        return cell
    }
    
    func getRented (email:String) -> Void{
        //Database setup
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        
        //resets variables to avoid duplication
        self.count = 0
        self.dressesRented = []
        
        ref.child("rentals").observeSingleEvent(of: .value, with: {(snapshot) in
            
            let rentalCollection = snapshot.value as? NSDictionary
            for item in rentalCollection!{
                
                let dressRental = item.value as? NSDictionary
                let building = dressRental?["building"] as! String
                
                //deals with some rentals not having drop off date, because they're 
                // scheduled to be picked up
                var date: String = ""
                if let temp = dressRental?["date"]{
                    date = temp as! String
                }else{
                    date = "N/A"
                }
                
                let dressID = dressRental?["dressName"] as! String
                let roomNum = dressRental?["roomNumber"] as! String
                let method = dressRental?["deliveryMethod"] as! String
                let userEmail = dressRental?["renterEmail"] as! String
                let name = dressRental?["renterName"] as! String
          
                if (email == userEmail){
                    //updates count
                    self.count += 1
                    //adds dress to rented dresses array (used to fill in
                    //dress cell content
                    let dress = RentInfo(renterName: name, renterEmail: userEmail, deliveryMethod: method, dressName: dressID, building: building, roomNumber: roomNum, date: date)
                    self.dressesRented.append(dress)
                }
            }
            DispatchQueue.main.async{self.tableView?.reloadData()}
        })
    }
    
    // When the keyboard is showing, tapping outside of the keyboard makes it go away
    @IBAction func tapToDismissKeyboard(_ sender: UITapGestureRecognizer) {
        email.resignFirstResponder() //hide the keyboard
        
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
