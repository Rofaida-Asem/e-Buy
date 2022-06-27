//
//  HomeViewController.swift
//  e-Buy
//
//  Created by Om Malikah  on 22/11/1443 AH.
//

import UIKit

class HomeViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    @IBOutlet weak var cartButton: UIBarButtonItem!
    @IBOutlet weak var adsCollectionView: UICollectionView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    @IBOutlet weak var brandsCollectionView: UICollectionView!
    var shouldAnimate = true
    var currentIndex = 0
    var adsImages = ["s1","s2","s3","s4"]
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        adsCollectionView.delegate = self
        adsCollectionView.dataSource = self
        brandsCollectionView.delegate = self
        brandsCollectionView.dataSource = self
    }
    
    func registerCell(){
        let adsCell = UINib(nibName: "AdsCollectionViewCell", bundle: nil)
        self.adsCollectionView.register(adsCell, forCellWithReuseIdentifier: "AdsCollectionViewCell")
        
        let brandsCell = UINib(nibName: "BrandsCollectionViewCell", bundle: nil)
        self.brandsCollectionView.register(brandsCell, forCellWithReuseIdentifier: "BrandsCollectionViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startTimer()
    }
    func startTimer(){
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.timeAction), userInfo: nil, repeats: true)
    }
    
    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    @objc func timeAction(){
        if shouldAnimate {
        if currentIndex < adsImages.count - 1 {
                currentIndex += 1
            }else{
                currentIndex = 0
            }
            adsCollectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return adsImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == adsCollectionView {
            
            guard let adsCell = adsCollectionView.dequeueReusableCell(withReuseIdentifier: "AdsCollectionViewCell", for: indexPath) as? AdsCollectionViewCell else {return UICollectionViewCell() }
            
            adsCell.adsImageView.image = UIImage(named: adsImages[indexPath.row])
            
            return adsCell
            
        }else{
            
            guard let brandsCell = brandsCollectionView.dequeueReusableCell(withReuseIdentifier: "BrandsCollectionViewCell", for: indexPath) as? BrandsCollectionViewCell else {return UICollectionViewCell() }
            return brandsCell
            
        }
    }
}
