//
//  DatabaseManager.swift
//  InstaClone
//
//  Created by Sarthak Mishra on 08/08/21.
//

import Foundation

import FirebaseDatabase


public class DatabaseManager{
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    
    public func canCreateNewUser(with email:String,userName:String,completion: ((Bool) -> Void)){
        completion(true)
    }
    
    
    public func insertNewUser(with email:String,userName:String,completion: @escaping (Bool)->Void){
        database.child(email.safeDatabaseKey()).setValue(["username":userName]){error,_ in
            if error == nil{
                completion(true)
                return
            }else{
                completion(false)
            }
        }
    }
}
