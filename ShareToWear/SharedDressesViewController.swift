//
//  SharedDressesViewController.swift
//  ShareToWear
//
//  Created by Kayla Nahi on 5/16/17.
//  Copyright © 2017 Kayla Nahi. All rights reserved.
//

import UIKit
import Firebase

class SharedDressesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var bannerWebID: UITextField!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var count:Int = 0
    var dressesShared = [SubmitInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self as UITableViewDataSource
        tableView.delegate = self as UITableViewDelegate
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //calls getShared after user enters their bannerweb ID and submits
    @IBAction func submitted(_ sender: UIButton) {
        let id = bannerWebID.text!
        getShared(ID: id)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dressCell", for: indexPath) as? SharedTableViewCell else{
            fatalError("Can't get cell of the right kind")
        }
        
        //Configure the cell
        let dress = dressesShared[indexPath.row]
        cell.configureCell(dress: dress)
        
        return cell
    }
    
        func getShared (ID:String) -> Void{
            //Database setup
            var ref: FIRDatabaseReference!
            ref = FIRDatabase.database().reference()
            
            //resets variables to avoid duplication
            self.count = 0
            self.dressesShared = []
    
            ref.child("users").observeSingleEvent(of: .value, with: {(snapshot) in
    
                let userCollection = snapshot.value as? NSDictionary
                for item in userCollection!{
                    
                    let dressSubmission = item.value as? NSDictionary
                    let bannerwebID = dressSubmission?["bannerWebID"] as! String
                    let type = dressSubmission?["type"] as! String
                    let brand = dressSubmission?["brand"] as! String
                    let userName = dressSubmission?["userName"] as! String
                    let oPrice = dressSubmission?["originalPrice"] as! String
                    let pPrice = dressSubmission?["preferredPrice"] as! String
                    let size = dressSubmission?["size"] as! String
                    let colors = dressSubmission?["colors"]
                    let title = dressSubmission?["dressTitle"] as! String
                    if (ID == bannerwebID){
                        //updates count
                        self.count += 1
                        //adds dress to shared dresses array (used to fill in 
                        //dress cell content
                        let dress = SubmitInfo(type: type, dressTitle: title, userName: userName , bannerWebID: bannerwebID, brand:brand , originalPrice: oPrice, preferredPrice:pPrice , size:size , color: colors as! [String])
                        self.dressesShared.append(dress)
                    }
                }
                DispatchQueue.main.async{self.tableView?.reloadData()}
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
    
    // When the keyboard is showing, tapping outside of the keyboard makes it go away
    @IBAction func tapToDismissKeyboard(_ sender: UITapGestureRecognizer) {
        bannerWebID.resignFirstResponder() //hide the keyboard
        
    }

}


