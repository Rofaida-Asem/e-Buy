//
//  MeViewController.swift
//  e-Buy
//
//  Created by salah waleed on 02/07/2022.
//

import UIKit

class MeViewController: UIViewController {
    let meViewModel : MeViewModel? = MeViewModel()
 
    
    @IBOutlet weak var welcomeLbl: UILabel!
    
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var orderView: UIView!
    
    @IBOutlet weak var orderTvView: UIView!
    @IBOutlet weak var orederTV: UITableView!
    
    @IBOutlet weak var wishListView: UIView!
    
    @IBOutlet weak var wishListTvView: UIView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationItems()
        title = "ME"
        if meViewModel?.ISLogin() == true {
            welcomeLbl.text = "Welcome" + " " + (meViewModel?.getUserDefault() ?? "")
            registerView.isHidden = true
            orderView.isHidden = false
            orderTvView.isHidden = false
            wishListView.isHidden = false
            wishListTvView.isHidden = false
        }else{
            registerView.isHidden = false
            orderView.isHidden = true
            orderTvView.isHidden = true
            wishListView.isHidden = true
            wishListTvView.isHidden = true
            setupUI()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func setupUI(){
      
        loginBtn.layer.cornerRadius = 10
        loginBtn.layer.masksToBounds = true
        registerBtn.layer.cornerRadius = 10
        registerBtn.layer.masksToBounds = true
    }

    @IBAction func goLogin(_ sender: UIButton) {
        let loginVc = LoginVC()
        self.navigationController?.pushViewController(loginVc , animated: true)
    }
    
    @IBAction func goRegister(_ sender: UIButton) {
        let registerVc = RegisterVC()
        self.navigationController?.pushViewController(registerVc, animated: true)
    }
    @IBAction func goToOreders(_ sender: UIButton) {
        
    }
    @IBAction func goToWishList(_ sender: UIButton) {
    }
    
 
    // MARK: - Navigation
    func setupNavigationItems() {
 
        let settingButton = UIBarButtonItem(image: UIImage(systemName: "seal"), style: .plain, target: self, action: #selector(settingTapped))
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(cartTapped))
        settingButton.tintColor = .purple
        cartButton.tintColor = .purple
        
        navigationItem.setRightBarButtonItems([settingButton,cartButton], animated: false)
 
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.purple]
        navigationController?.navigationBar.tintColor = .purple
        
        
    }
    
    @objc
    private func settingTapped() {
        print(" ")
    }
    @objc
    private func cartTapped() {
        print("cart tapped!!")
    }
 

}
