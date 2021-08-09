//
//  StorageManager.swift
//  InstaClone
//
//  Created by Sarthak Mishra on 08/08/21.
//

import Foundation

import FirebaseStorage


public class StorageManager{
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error{
        case failedToDownload
    }
    
    
    public func uploadUserPhotoPost(model: PhotoPost, completion:@escaping (Result<URL,Error>) -> Void){
        
    }
    
    public func downloadImage(with reference:String,completion: @escaping(Result<URL, IGStorageManagerError>) -> Void){
        bucket.child(reference).downloadURL(completion: {url,error in
            guard let url = url, error == nil else{
                completion(.failure(.failedToDownload))
                return
            }
            
            completion(.success(url))
        })
    }
    
}

public enum UserPostType{
    case photo,video
}

public struct PhotoPost {
    let postType: UserPostType
}
