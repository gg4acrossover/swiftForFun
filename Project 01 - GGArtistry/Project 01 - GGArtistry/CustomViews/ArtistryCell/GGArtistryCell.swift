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

final class GGArtistryCell: UITableViewCell, GGBaseCellProtocol {
    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var introductionLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailButton: UIButton!
    
    var clickdetailButtonEvent : (()->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.detailButton.isHidden = true
        self.detailButton.addTarget(self, action: #selector(clickDetailButton(sender:)), for: .touchUpInside)
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // always fix iconImage size
        self.iconImage.frame = CGRect(x: 5.0, y: 5.0, width: 128, height: 128)
    }
    
    func displayData(item : GGArtistryCellDisplayProtocol) {
        
        guard let icon = item.icon,
            let introduction = item.introduction,
            let titleLabel = item.titleLabel
        else {
            return
        }
        
        self.iconImage.contentMode = .scaleAspectFill
        self.iconImage.image = UIImage(named: icon)
        
        self.introductionLabel.text = introduction
        
        self.titleLabel.text = titleLabel
    }
    
    /// callback for click detail button
    func clickDetailButton( sender : UIButton) {
        if let block = self.clickdetailButtonEvent {
            block()
        }
    }
}
