//
//  HomeViewController.swift
//  e-Buy
//
//  Created by Om Malikah  on 22/11/1443 AH.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    @IBOutlet weak var cartButton: UIBarButtonItem!
    @IBOutlet weak var adsCollectionView: UICollectionView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    @IBOutlet weak var brandsCollectionView: UICollectionView!
    
    var homeViewModel: HomeViewModel?

    override func viewWillAppear(_ animated: Bool) {
        registerCell()
        homeViewModel = HomeViewModel(serviece: ApiService())
        homeViewModel?.bindingResult = { [weak self] in
            DispatchQueue.main.async {
                self?.brandsCollectionView.reloadData()
            }
        }
        homeViewModel?.getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        adsCollectionView.delegate = self
        adsCollectionView.dataSource = self
        brandsCollectionView.delegate = self
        brandsCollectionView.dataSource = self
        
        adsCollectionView.layer.borderWidth = 2.0
        adsCollectionView.layer.cornerRadius = 20.0
        brandsCollectionView.layer.borderWidth = 2.0
        brandsCollectionView.layer.cornerRadius = 20.0
        
    }
    
    func registerCell(){
        let adsCell = UINib(nibName: "AdsCollectionViewCell", bundle: nil)
        self.adsCollectionView.register(adsCell, forCellWithReuseIdentifier: "AdsCollectionViewCell")
        
        let brandsCell = UINib(nibName: "BrandsCollectionViewCell", bundle: nil)
        self.brandsCollectionView.register(brandsCell, forCellWithReuseIdentifier: "BrandsCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel?.brands?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == adsCollectionView {
            
            guard let adsCell = adsCollectionView.dequeueReusableCell(withReuseIdentifier: "AdsCollectionViewCell", for: indexPath) as? AdsCollectionViewCell else {return UICollectionViewCell() }
            return adsCell
            
        }else{
            
            guard let brandsCell = brandsCollectionView.dequeueReusableCell(withReuseIdentifier: "BrandsCollectionViewCell", for: indexPath) as? BrandsCollectionViewCell else {return UICollectionViewCell() }
            guard let brands =  homeViewModel?.brands else {return
                brandsCell }
            brandsCell.brandImageView.kf.setImage(with: URL(string: brands[indexPath.row].image?.src ?? ""))
            brandsCell.brandNameLabel.text = brands[indexPath.row].title
            return brandsCell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let producrVC = ProductsViewController(nibName: "ProductsViewController", bundle: nil)
        //let Navigation = UINavigationController(rootViewController: producrVC)

        producrVC.modalPresentationStyle = .fullScreen
        self.present(producrVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: brandsCollectionView.frame.width/4, height: brandsCollectionView.frame.height/4 )
        
    }
}
