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
        title = "Welcome"
        setupNavigationItems()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    func setupui(){
        backVew.layer.cornerRadius = 30
        self.backVew.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                self.backVew.layer.masksToBounds = true
 
        registerBtn.titleLabel?.minimumScaleFactor = 0.5
        lognBtn.layer.cornerRadius = lognBtn.frame.height / 2 - 10
        emailTf.text = ""
        passwordTf.text = ""
    }
    @IBAction func goLoginBtn(_ sender: UIButton) {
        
        if emailTf.text != "" && passwordTf.text != "" {
            guard let email = emailTf.text else {return}
            if email.isValidEmail == true {
                loginViewModel?.login(email: email , password: passwordTf.text!)
                loginViewModel?.bindingResult = {
                    if self.loginViewModel?.sucess == true {
                        ProgressHUD.showSuccess("successfuly Login")
                   let homeVC =  HomeViewController()
                     self.navigationController?.pushViewController(homeVC, animated: true)
                    }else{
                        ProgressHUD.showError("Invalid Email Or Password")
                    }
                }
            }else{
                ProgressHUD.showError("pleas insert email successfuly !!")
            }
        }else{
            ProgressHUD.showError("pleas fill all fields !!")
        }
  
    }
    
   
    @IBAction func doRegisterBtn(_ sender: UIButton) {
        let regVc = RegisterVC()
        self.navigationController?.pushViewController(regVc, animated: true)
    }
    
    
    
    
    func setupNavigationItems() {
 
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.purple]
        navigationController?.navigationBar.tintColor = .purple
        
    }
 
}
