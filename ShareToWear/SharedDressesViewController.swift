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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.dataSource = self as! UITableViewDataSource
        tableView.delegate = self as! UITableViewDelegate
        //tableView.reloadData()
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
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dressCell", for: indexPath)
        
        return cell
    }
    
        func getShared (ID:String) -> Void{
            //Database setup
            var ref: FIRDatabaseReference!
            ref = FIRDatabase.database().reference()
    
            ref.child("users").observeSingleEvent(of: .value, with: {(snapshot) in
    
                let userCollection = snapshot.value as? NSDictionary
                for item in userCollection!{
                    let title = String(describing: item)
                    let dressSubmission = item.value as? NSDictionary
                    let bannerwebID = dressSubmission?["bannerWebID"] as! String
                    let type = dressSubmission?["type"] as! String
                    let brand = dressSubmission?["brand"] as! String
                    let userName = dressSubmission?["userName"] as! String
                    let oPrice = dressSubmission?["originalPrice"] as! String
                    let pPrice = dressSubmission?["preferredPrice"] as! String
                    let size = dressSubmission?["size"] as! String
                    if (ID == bannerwebID){
                        self.count += 1
                        let dress = SubmitInfo(type: type, dressTitle: title, userName: userName , bannerWebID: bannerwebID, brand:brand , originalPrice: oPrice, preferredPrice:pPrice , size:size , color: [""])
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


