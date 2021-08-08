//
//  AuthManager.swift
//  InstaClone
//
//  Created by Sarthak Mishra on 08/08/21.
//

import Foundation

import FirebaseAuth


public class AuthManager{
    
    static let shared = AuthManager()
    
    
    public func registerNewUser(email:String,userName:String,password:String,completion:@escaping (Bool) -> Void){
        
        DatabaseManager.shared.canCreateNewUser(with: email, userName: userName){canCreate in
            if canCreate{
                Auth.auth().createUser(withEmail: email, password: password){result,error in
                    guard result != nil, error == nil else {
                        completion(false)
                        return
                    }
                    
                    DatabaseManager.shared.insertNewUser(with: email, userName: userName){inserted in
                        if inserted{
                            completion(true)
                        }else{
                            completion(false)
                        }
                    }
                    
                }
            }else{
                completion(false)
            }
        }
        
    }
    
    
    public func loginUser(email:String?,userName:String?,password:String,completion:@escaping(Bool) -> Void){
        
        if let email = email{
            
            Auth.auth().signIn(withEmail: email, password: password, completion: {auth,err in
                guard auth != nil, err == nil else{
                    completion(false)
                    return
                }
                completion(true)
                
            })
            
            
        }else if let userName = userName{
            
        }
        
        
    }
}
