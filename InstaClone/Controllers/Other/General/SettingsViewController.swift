//
//  SettingsViewController.swift
//  InstaClone
//
//  Created by Sarthak Mishra on 08/08/21.
//

import UIKit
import SafariServices

struct SettingCellModal{
    let title: String
    let handler: (() -> Void)
}

final class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        
        let table = UITableView(frame: .zero,style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
        
    }()
    
    private var data = [[SettingCellModal]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureModels(){
        
        data.append([
            SettingCellModal(title: "Edit Profile"){[weak self] in
                self?.didTapEditProfile()
            },
            SettingCellModal(title: "Invite Friends"){[weak self] in
                self?.didTapInviteFriends()
            },
            SettingCellModal(title: "Save original posts"){[weak self] in
                self?.didTapSaveOriginalPost()
            }
        ])
        
        data.append([
            SettingCellModal(title: "Terms of Service"){[weak self] in
                self?.openURL(type:.terms)
            },SettingCellModal(title: "Privacy Policy"){[weak self] in
                self?.openURL(type:.privacy)
            },SettingCellModal(title: "Help / Feedback"){[weak self] in
                self?.openURL(type:.help)
            }
        ])
        
        data.append([
            SettingCellModal(title: "Log Out"){[weak self] in
                self?.didTapLogout()
            }
        ])
    }
    
    enum SettingsURLTypes{
        case terms,privacy,help
    }
    
    private func didTapEditProfile(){
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let nacVC = UINavigationController(rootViewController: vc);
        nacVC.modalPresentationStyle = .fullScreen
        present(nacVC, animated: true, completion: nil)
    }
    
    private func didTapInviteFriends(){
        
    }
    
    private func didTapSaveOriginalPost(){
        
    }
    
    private func openURL(type:SettingsURLTypes){
        let urlString: String
        switch type {
        case .terms:urlString = "https://www.instagram.com/terms/accept/?hl=en"
        case .privacy:urlString = "https://help.instagram.com/519522125107875"
        case .help:urlString = "https://help.instagram.com"
        }
        
        guard let url = URL(string:urlString) else{
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    
    private func didTapLogout(){
        
        let actionSheet = UIAlertController(title: "Log Out", message: "Are you sure to logout", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: {_ in
            AuthManager.shared.logout(completion: {success in
                DispatchQueue.main.async {
                    if success{
                        let vc = LoginViewController()
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true, completion: {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        })
                    }else{
                        
                    }
                }
            })
        }))
        
        present(actionSheet, animated: true)
        
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
}


extension SettingsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.section][indexPath.row]
        model.handler()
    }
    
    
}
