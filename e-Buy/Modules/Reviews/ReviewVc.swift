//
//  ReviewVc.swift
//  e-Buy
//
//  Created by salah waleed on 04/07/2022.
//

import UIKit

class ReviewVc: UIViewController {

    @IBOutlet weak var reviewTv: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupNavigationItems()
        // Do any additional setup after loading the view.
        self.title = "Reviews About Product"
    }

    func registerCell(){
        
 
        reviewTv.register(UINib(nibName: "RateTVCell", bundle: nil), forCellReuseIdentifier: "RateTVCell")
    }
    
    func setupNavigationItems() {
 
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.purple]
        navigationController?.navigationBar.tintColor = .purple
        
 
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ReviewVc:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
               guard let cell = tableView.dequeueReusableCell(withIdentifier: "RateTVCell", for: indexPath) as? RateTVCell else {return UITableViewCell()}
               
               return cell
           }
           func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               return reviewTv.frame.height / 5
           }
           
  
    
    
    
    
    
}
