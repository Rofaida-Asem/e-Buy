//
//  LoginVC.swift
//  e-Buy
//
//  Created by salah waleed on 23/06/2022.
//

import UIKit
import ProgressHUD
class LoginVC: UIViewController {
//MARK: - outlet
    
    let loginViewModel:LoginViewModel? =  LoginViewModel()
    @IBOutlet weak var backVew: UIView!
    
    @IBOutlet weak var loginLbl: UILabel!
    
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var passwordTf: UITextField!
    
    
    @IBOutlet weak var lognBtn: UIButton!
    
    @IBOutlet weak var donthvaccLbl: UILabel!
    
    @IBOutlet weak var registerBtn: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupui()
        setupNavigationItems()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel?.login(email: "sasa@gmail.com", password: "11")
    }
    func setupui(){
        backVew.layer.cornerRadius = 30
        self.backVew.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                self.backVew.layer.masksToBounds = true
 
        registerBtn.titleLabel?.minimumScaleFactor = 0.5
        lognBtn.layer.cornerRadius = lognBtn.frame.height / 2 - 10
    }
    @IBAction func goLoginBtn(_ sender: UIButton) {
        if emailTf.text != "" && passwordTf.text != "" {
            guard let email = emailTf.text else {return}
            if email.isValidEmail == true {
                
            }else{
                ProgressHUD.showError("pleas insert email successfuly !!")
            }
        }else{
            ProgressHUD.showError("pleas fill all fields !!")
        }
       
    }
    
   
    @IBAction func doRegisterBtn(_ sender: UIButton) {
        let regVc = RegisterVC()
        regVc.modalPresentationStyle = .fullScreen
        self.present(regVc, animated: true)
    }
    
    
    
    
    func setupNavigationItems() {
        let favButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(favoTapped))
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(cartTapped))
        favButton.tintColor = .purple
        cartButton.tintColor = .purple
        
        navigationItem.setRightBarButtonItems([favButton], animated: false)
        navigationItem.setLeftBarButtonItems([cartButton], animated: false)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.purple]
        
        
    }
    @objc
    private func favoTapped() {
        print("fav tapped!!")
    }
    @objc
    private func cartTapped() {
        print("cart tapped!!")
    }
}
