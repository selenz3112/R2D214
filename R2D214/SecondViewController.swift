//
//  SecondViewController.swift
//  R2D214
//
//  Created by user178354 on 2/25/21.
//  Copyright © 2021 user178354. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController:UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView2: UITableView!
    let arrayOf = ArrayOf()
    //    var tableViewCount = [1,2,3,4,5]
    var counter = 000001
    var check = 1
    var IDNumber: [String] = []
    override func viewDidLoad(){
        super.viewDidLoad()
        loadDatabaseIDNums()
        tableView2.dataSource = self
        //  getData()
    }
    //    public func getData(){
    //
    //        arrayOf.IDNumber = []
    //        arrayOf.counselor = []
    //        arrayOf.Email = []
    //        arrayOf.firstName = []
    //        arrayOf.lastName = []
    //
    //        let reference = Database.database().reference()
    //        print(reference)
    //
    //        reference.observeSingleEvent(of: .value) { (snapshot) in
    //            //
    //            //                    for i in self.counter...999999 {
    //            //                        snapshot.childSnapshot(forPath: String(i))
    //            //                        self.arrayOf.IDNumber.append(String(i))
    //            //                var secondID = snapshot.childSnapshot(forPath: "621092")
    //            //                var thirdID = snapshot.childSnapshot(forPath: "623182")
    //            //                        self.counter += 000001
    //            //                    }
    //            for data in snapshot.children.allObjects as! [DataSnapshot] {
    //                let IDNumber = data.key
    //                print(self.arrayOf.IDNumber)
    //                let dictionary = data.value as! NSDictionary
    //                print(IDNumber)
    ////                let CounselorDictionary = dictionary["counselor"] as! String
    ////                let EmailDictionary = dictionary["E-mail"] as! String
    //            //let firstNameDictionary = dictionary["First Name"] as! String
    ////                let lastNameDictionary = dictionary["Last Name"] as! String
    //            }
    //        }
    
    func loadDatabaseIDNums() {
        var check = 1
        if check == 1 {
            IDNumber = []
            check = 2
        }
        let reference = Database.database().reference()
        reference.observeSingleEvent(of: .value) { (snapshot) in
            for dataa in snapshot.children.allObjects as! [DataSnapshot] {
                let id = dataa.key
                if self.IDNumber.contains(id) {
                    
                }
                else {
                    self.IDNumber.append(id)
                    print("id: ",id)
                    print(self.IDNumber)
                }
            }
        }
    }
    
    //                    self.tableView.reloadData()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        loadDatabaseIDNums()
        print(self.IDNumber.count)
        return IDNumber.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = "\("hello"[indexPath.row])"
        return cell
    }
}
