//
//  FeedVC.swift
//  moza-ready
//
//  Created by Syed Rab on 7/11/17.
//  Copyright © 2017 Moza. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signOut: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        signOut.isUserInteractionEnabled = true
        signOut.addGestureRecognizer(tapGestureRecognizer)
    }

    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let removeSuccessful: Bool = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("MOZA: ID Removed from KeyChain - \(removeSuccessful)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
        
    // Your action
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        let removeSuccessful: Bool = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("MOZA: ID Removed from KeyChain - \(removeSuccessful)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
}
