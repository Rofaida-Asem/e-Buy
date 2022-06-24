//
//  SettingsViewController.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 23/06/2022.
//

import UIKit

class SettingsViewController: UIViewController {
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func addressButton(_ sender: UIButton) {
        
    }
    
    @IBAction func currencyButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Change Currency", message: "What currency do you want ?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "USD", style: .default, handler: { [self] _ in
            
        }))
        alert.addAction(UIAlertAction(title: "EGP", style: .cancel))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func contactUsButton(_ sender: UIButton) {
        
    }
    
    @IBAction func aboutUsButton(_ sender: UIButton) {
        
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        
    }
    
   

}
