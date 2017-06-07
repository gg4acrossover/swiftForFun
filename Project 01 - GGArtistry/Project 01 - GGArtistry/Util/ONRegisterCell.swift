//
//  ONRegisterCell.swift
//  Project 01 - GGArtistry
//
//  Created by viethq on 6/7/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func on_register< T : GGBaseCellProtocol>(type: T.Type)  {
        self.register(T.getNib(), forCellReuseIdentifier: T.getNibName())
    }
    
    func on_dequeue< T : GGBaseCellProtocol>(idxPath : IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.getNibName(), for: idxPath) as? T else {
            fatalError("couldnt dequeue cell with identifier \(T.getNibName())")
        }
        
        return cell
    }
}

extension UICollectionView {
    func on_register< T : GGBaseCellProtocol>(type: T.Type)  {
        self.register(T.getNib(), forCellWithReuseIdentifier: T.getNibName())
    }
    
    
    func on_dequeueReusable< T : GGBaseCellProtocol>(idxPath : IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.getNibName(), for: idxPath) as? T else {
            fatalError("couldnt dequeue cell with identifier \(T.getNibName())")
        }
        
        return cell
    }
}




