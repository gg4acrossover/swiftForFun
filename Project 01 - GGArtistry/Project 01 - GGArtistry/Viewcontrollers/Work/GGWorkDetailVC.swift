//
//  GGWorkDetailVC.swift
//  Project 01 - GGArtistry
//
//  Created by viethq on 4/12/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import UIKit

//config
fileprivate let kSectionInsert = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)

//MARK: - define GGWorkDetailVC
final class GGWorkDetailVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var works = [GGWorkModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingUI()
    }
}

//MARK: - UI style
extension GGWorkDetailVC {
    func settingUI() {
        
        //
        self.title = "Works"
        
        //
        self.collectionView.register(GGWorkCell.getNib(), forCellWithReuseIdentifier: GGWorkCell.getNibName())
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}

//MARK: - UICollectioview delegate & datasource
extension GGWorkDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.works.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GGWorkCell.getNibName(), for: indexPath) as! GGWorkCell
        
        let item = self.works[indexPath.row]
        
        if let imgStr = item.image {
            cell.iconImage.image = UIImage(named: imgStr)
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension GGWorkDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 115, height: 115)
    }
    
    //2
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return kSectionInsert
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return kSectionInsert.left
    }
    
    //4
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return kSectionInsert.left
    }
}
