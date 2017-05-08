//
//  GGBaseCellProtocol.swift
//  Project 01 - GGArtistry
//
//  Created by viethq on 4/11/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import UIKit

/**
    cell protocol for uicollectionview, uitableview
 */
protocol GGBaseCellProtocol {
    static func getNibName() -> String // return nibname of cell
    static func getNib() -> UINib // return nib of cell
}


/**
    default implement for cell
 */
extension GGBaseCellProtocol where Self : UICollectionViewCell {
    /// collectionView get nibname
    static func getNibName() -> String {
        return String(describing: self)
    }
    
    /// collectionView get nib
    static func getNib() -> UINib {
        return UINib.init(nibName: self.getNibName(), bundle: nil)
    }
}

extension GGBaseCellProtocol where Self : UITableViewCell {
    /// tableview get nibname
    static func getNibName() -> String {
        return String(describing: self)
    }
    
    /// tableview get nib
    static func getNib() -> UINib {
        return UINib.init(nibName: self.getNibName(), bundle: nil)
    }
}
