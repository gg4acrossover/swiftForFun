//
//  GGArtistryCell.swift
//  Project 01 - GGArtistry
//
//  Created by viethq on 4/7/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import UIKit

protocol GGArtistryCellDisplayProtocol {
    var icon : String? { get }
    var introduction : String? { get }
    var titleLabel : String? { get }
}

final class GGArtistryCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var introductionLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func displayData(item : GGArtistryCellDisplayProtocol) {
        
        guard let icon = item.icon,
            let introduction = item.introduction,
            let titleLabel = item.titleLabel
        else {
            return
        }
        
        self.iconImage.image = UIImage(named: icon)
        
        self.introductionLabel.text = introduction
        
        self.titleLabel.text = titleLabel
    }
}
