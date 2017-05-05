//
//  GGWorkModel.swift
//  Project 01 - GGArtistry
//
//  Created by viethq on 4/7/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import UIKit
import ObjectMapper

class GGWorkModel: NSObject, Mappable {
    var image : String?
    var title : String?
    var info : String?
    var isExpand = false
    
    
    required init?(map: Map) {
        //TODO: init implement for Mappable
    }
    
    func mapping(map: Map) {
        self.image <- map["image"]
        self.title <- map["title"]
        self.info <- map["info"]
    }
}
