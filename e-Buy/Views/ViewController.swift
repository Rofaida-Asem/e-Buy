//
//  ViewController.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 20/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button(_ sender: Any) {
        
        let vc = HomeViewController()
        self.present(vc, animated: true)
        
    }

}

