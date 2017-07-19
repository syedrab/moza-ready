//
//  DataService.swift
//  moza-ready
//
//  Created by Syed Rab on 7/18/17.
//  Copyright © 2017 Moza. All rights reserved.
//

import Foundation
import FirebaseDatabase

let DB_BASE = Database.database().reference()

class DataService {
    
    static let ds = DataService()
    private var _RDF_BASE = DB_BASE
    private var _RDF_POSTS = DB_BASE.child("posts")
    private var _RDF_USERS = DB_BASE.child("users")

    var REF_BASE: DatabaseReference {
        return _RDF_BASE
    }
    var REF_POSTS: DatabaseReference {
        return _RDF_POSTS
    }
    var REF_USERS: DatabaseReference {
        return _RDF_USERS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        _RDF_USERS.child(uid).updateChildValues(userData)
    }
}
