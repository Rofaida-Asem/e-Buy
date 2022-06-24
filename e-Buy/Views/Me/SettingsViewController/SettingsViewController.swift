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
        let addressViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddressViewController") as! AddressViewController
        addressViewController.modalPresentationStyle = .fullScreen
        self.present(addressViewController, animated: true)
    }
    
    @IBAction func currencyButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Change Currency", message: "What currency do you want ?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "USD", style: .default, handler: { [self] _ in
            
        }))
        alert.addAction(UIAlertAction(title: "EGP", style: .cancel))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func contactUsButton(_ sender: UIButton) {
        let contactUsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
        contactUsViewController.modalPresentationStyle = .fullScreen
        self.present(contactUsViewController, animated: true)
    }
    
    @IBAction func aboutUsButton(_ sender: UIButton) {
        let aboutUsViewController = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
        aboutUsViewController.modalPresentationStyle = .fullScreen
        self.present(aboutUsViewController, animated: true)
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        
    }
    
   

}
