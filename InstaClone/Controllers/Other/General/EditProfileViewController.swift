//
//  EditProfileViewController.swift
//  InstaClone
//
//  Created by Sarthak Mishra on 08/08/21.
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapSave))
        
    }
    
    @objc private func didTapSave(){
        
    }
    
    @objc private func didTapCancel(){
        
    }
    
    @objc private func didTapUpdateProfilePicture(){
        
        let actionSheet = UIAlertController(title: "Upload Picture", message: "Update Profile Picture", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Take Picture", style: .default, handler: {_ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Choose Picture from library", style: .default, handler: {_ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true)
        
        
    }


}
