//
//  Constants.swift
//  Messenger
//
//  Created by Adarsh Begur on 23/07/24.
//

import Foundation
import Firebase

struct FirestoreConstants {
    
    static let UserCollection = Firestore.firestore().collection("users")
    static let messagesCollection = Firestore.firestore().collection("messages")
}
