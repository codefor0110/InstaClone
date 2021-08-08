//
//  LoginViewController.swift
//  InstaClone
//
//  Created by Sarthak Mishra on 08/08/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let usernameEmailField: UITextField = {
        return UITextField()
    }()
    
    private let passwordField: UITextField = {
        let password = UITextField()
        password.isSecureTextEntry = true
        return password
        
    }()
    
    private let loginButton: UIButton = {
        return UIButton()
    }()
    
    private let headerView: UIView = {
        return UIView()
    }()
    
    private let termsButton: UIButton = {
        return UIButton()
    }()
    
    private let privacyButton: UIButton = {
        return UIButton()
    }()
    
    private let createAccountButton: UIButton = {
        return UIButton()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    private func addSubViews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
        
    }
    
    
    @objc private func didTapLogin(){
        
    }
    
    @objc private func didTapTerms(){
        
    }
    
    @objc private func didTapPrivacy(){
        
    }
    
    @objc private func didTapCreateAccount(){
        
    }
    
    
    
}
