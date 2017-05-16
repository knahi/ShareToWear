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
        let id = bannerWebID.text!
       //getShared(ID: id)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dressCell", for: indexPath)
        return cell
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

//extension UIViewController: UITableViewDataSource, UITableViewDelegate {
//    var count = 0
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return elements.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // Getting the right element
//        let element = elements[indexPath.row]
//
//        // Trying to reuse a cell
//        let cellIdentifier = "ElementCell"
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
//        
//        // Adding the right informations
//        cell.textLabel?.text = element.symbol
//        cell.detailTextLabel?.text = element.name
//
//        // Returning the cell
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//    
//    func getShared (ID:String) -> Void{
//        //Database setup
//        var ref: FIRDatabaseReference!
//        ref = FIRDatabase.database().reference()
//
//        ref.child("users").observeSingleEvent(of: .value, with: {(snapshot) in
//
//            let userCollection = snapshot.value as? NSDictionary
//            for item in userCollection!{
//                let dressSubmission = item.value as? NSDictionary
//                let bannerwebID = dressSubmission?["bannerWebID"] as! String
//                if (ID == bannerwebID){
//                    count += 1
//                }
//            }
//            DispatchQueue.main.async{self.tableView?.reloadData()}
//        })
//    }
//
//}
