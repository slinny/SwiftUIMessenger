//
//  FirebaseConstants.swift
//  SwiftUIMessenger
//
//  Created by Siran Li on 4/20/25.
//

import Foundation
import Firebase
import FirebaseStorage

enum FirebaseConstants {
    private static let DatabaseRef = Database.database().reference()
    static let UserRef = DatabaseRef.child("users")
}
