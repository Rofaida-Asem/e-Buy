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
        showActionSheet()
        
    }
    
    @IBAction func contactUsButton(_ sender: UIButton) {
        showContactUsVC()
    }
    
    @IBAction func aboutUsButton(_ sender: UIButton) {
        showAboutUsVC()
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        
    }
    
    func showContactUsVC() {
        
        let contactUsViewController = ContactUsViewController(nibName: "ContactUsViewController", bundle: .main)
        contactUsViewController.modalPresentationStyle = .fullScreen
        presentingViewController?.present(contactUsViewController, animated: true)
    }
    
    func showAboutUsVC() {
        
        let aboutUsViewController = AboutUsViewController(nibName: "AboutUsViewController", bundle: .main)
        aboutUsViewController.modalPresentationStyle = .fullScreen
        presentingViewController?.present(aboutUsViewController, animated: true)
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
