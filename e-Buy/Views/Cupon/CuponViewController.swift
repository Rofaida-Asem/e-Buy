//
//  CuponViewController.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 28/06/2022.
//

import UIKit

class CuponViewController: UIViewController {

    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var shibimgFeesLabel: UILabel!
    
    @IBOutlet weak var cuponTextField: UITextField!
    
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var grandTotalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    
    @IBAction func validateButton(_ sender: UIButton) {
    }
    
    @IBAction func placeOrderButton(_ sender: UIButton) {
    }
}
