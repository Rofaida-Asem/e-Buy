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
        showAddressVC()
    }
    
    @IBAction func currencyButton(_ sender: UIButton) {
        showActionSheet()
    }
    
    @IBAction func contactUsButton(_ sender: UIButton) {
        showContactUsVC()
    }
    
    @IBAction func aboutUsButton(_ sender: UIButton) {
        showAboutUsVC()
    }
    
   
    
    func showAddressVC() {
        
        let addressViewController = AddressViewController(nibName: "AddressViewController", bundle: nil)
        navigationController?.pushViewController(addressViewController, animated: true)
    }
    
    func showContactUsVC() {

        let contactUsViewController = ContactUsViewController(nibName: "ContactUsViewController", bundle: nil)
        navigationController?.pushViewController(contactUsViewController, animated: true)
    }
    
    func showAboutUsVC() {
        
        let aboutUsViewController = AboutUsViewController(nibName: "AboutUsViewController", bundle: .main)
        navigationController?.pushViewController(aboutUsViewController, animated: true)
    }
    
    
    func showActionSheet(){
        
        let alert = UIAlertController(title: "Change Currency", message: "What currency do you want ?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "USD", style: .default, handler: { [self] _ in
            printContent("Change to USD")
        }))
        alert.addAction(UIAlertAction(title: "EGP", style: .default, handler: { [self] _ in
            printContent("Change to EGP")
        }))
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: { [self] _ in
            printContent("Dismissed")
        }))
        present(alert, animated: true, completion: nil)
        
    }
   

}

