//
//  LoginViewController.swift
//  InstaClone
//
//  Created by Sarthak Mishra on 08/08/21.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let usernameEmailField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.isSecureTextEntry = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        return field
        
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an Account", for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameEmailField.delegate = self
        passwordField.delegate = self
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTerms), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacy), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        addSubViews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.frame = CGRect(x: 0,
                                  y: 0.0,
                                  width: view.width,
                                  height: view.height/3.0
        )
        
        usernameEmailField.frame = CGRect(x: 20,
                                          y: headerView.bottom + 40,
                                          width: view.width-50,
                                          height: 52.0
        )
        
        passwordField.frame = CGRect(x: 20,
                                     y: usernameEmailField.bottom + 10,
                                     width: view.width-50,
                                     height: 52.0
        )
        
        loginButton.frame = CGRect(x: 20,
                                   y: passwordField.bottom + 10,
                                   width: view.width-50,
                                   height: 52.0
        )
        
        createAccountButton.frame = CGRect(x: 20,
                                           y: loginButton.bottom + 10,
                                           width: view.width-50,
                                           height: 52.0
        )
        
        termsButton.frame = CGRect(x: 10,
                                   y: view.height-view.safeAreaInsets.bottom-100,
                                   width: view.width-20,
                                   height: 50.0
        )
        
        
        privacyButton.frame = CGRect(x: 10,
                                     y: view.height-view.safeAreaInsets.bottom-50,
                                     width: view.width-20,
                                     height: 50.0
        )
        
        
        
        configureHeaderView()
        
    }
    
    private func configureHeaderView(){
        guard headerView.subviews.count == 1 else{
            return
        }
        
        guard let backgrouvdView = headerView.subviews.first else{
            return
        }
        
        backgrouvdView.frame = headerView.bounds
        
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4, y: view.safeAreaInsets.top, width: headerView.width/2.0, height: headerView.height-view.safeAreaInsets.top)
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
        
        passwordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
            
        
        guard let userNameField = usernameEmailField.text, !userNameField.isEmpty,
              let passwordFieldText = passwordField.text, !passwordFieldText.isEmpty, passwordFieldText.count >= 8
        else{
            return
        }
        
        
        
        var userName: String?
        var email: String?
        
        if userNameField.contains("@"),userNameField.contains("."){
            email = userNameField
        }else{
            userName = userNameField
        }
        
        
        
        AuthManager.shared.loginUser(email: email, userName: userName, password: passwordFieldText) {success in
            
            DispatchQueue.main.async {
                if success {
                    self.dismiss(animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "Log in error", message: "We are ubale to log you in", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    
                    self.present(alert, animated: true)
                }
            }
            
        }
    }
    
    @objc private func didTapTerms(){
        
        guard let url = URL(string: "https://www.instagram.com/terms/accept/?hl=en") else{
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapPrivacy(){
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else{
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapCreateAccount(){
        let vc = RegistratonViewController()
        vc.title = "Create Account"
        
        present(UINavigationController(rootViewController: vc),animated: true)
    }
    
    
    
}


extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField{
            passwordField.becomeFirstResponder()
        }else if textField == passwordField{
            didTapLogin()
        }
        
        return true
    }
    
    
}
