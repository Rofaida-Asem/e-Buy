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
    }
    @IBAction func goLoginBtn(_ sender: UIButton) {
//        ProgressHUD.showError("invalid Email or password")
//        ProgressHUD.colorHUD(.brown)
//        ProgressHUD.fontStatus(.boldSystemFont(ofSize: 18))
//        ProgressHUD.colorStatus(.orange)
//        ProgressHUD.colorSpinner(.green)
        ProgressHUD.showSuccess("succcessfuly login ")
    }
    
   
    @IBAction func doRegisterBtn(_ sender: UIButton) {
        let regVc = RegisterVC()
        regVc.modalPresentationStyle = .fullScreen
        self.present(regVc, animated: true)
    }
    
}
