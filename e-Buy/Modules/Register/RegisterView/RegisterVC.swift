//
//  RegisterVC.swift
//  e-Buy
//
//  Created by salah waleed on 27/06/2022.
//

import UIKit

class RegisterVC: UIViewController {

    //MARK: - OuteLet
    
    @IBOutlet weak var backVew: UIView!
    
    @IBOutlet weak var firstNameTf: UITextField!
    
    
    @IBOutlet weak var lastNameTf: UITextField!
    
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var passTf: UITextField!
    
    @IBOutlet weak var confirmPassTf: UITextField!
    
    @IBOutlet weak var regBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupui()
    }

    func setupui(){
        backVew.layer.cornerRadius = 30
        self.backVew.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                self.backVew.layer.masksToBounds = true
 
 
        regBtn.layer.cornerRadius = regBtn.frame.height / 2 - 10
    }

}
