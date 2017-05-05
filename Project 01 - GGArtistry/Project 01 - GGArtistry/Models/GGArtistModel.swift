//
//  GGArtistModel.swift
//  Project 01 - GGArtistry
//
//  Created by viethq on 4/7/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyJSON

//MARK: - GGArtistModel define
class GGArtistModel: NSObject, Mappable {
    
    var name : String?
    var bio : String?
    var image : String?
    var works = [GGWorkModel]()
    
    var isExpand = false
    
    /// get artist from resources
    static func artistsFromBundle() -> [GGArtistModel]? {
        // if URL invalid, return nil
        guard let url = Bundle.main.url(forResource: "artists", withExtension: "json") else {
            return nil
        }
        
        // create artist container
        var artists = [GGArtistModel]()
        
        //
        do {
            let data = try Data(contentsOf: url)
            //let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
            let json = JSON.init(data: data)
            
            guard let artistsDict = json["artists"].arrayObject else {
                return nil
            }
            
            for item in artistsDict {
                
                if let artist = GGArtistModel(JSON:(item as! [String:Any])) {
                    artists.append(artist)
                }
            }
        }
        catch {
            debugPrint("error")
            return nil
        }
        
        return artists
    }
    
    /// implement protocol ObjectMapper
    required init?(map: Map) {
        //TODO: init implement for Mappable
    }
    
    /// implement protocol ObjectMapper
    func mapping(map: Map) {
        self.name <- map["name"]
        self.bio <- map["bio"]
        self.image <- map["image"]
        self.works <- map["works"]
    }

}

//MARK: - display data for GGArtistryCell
extension GGArtistModel : GGArtistryCellDisplayProtocol {
    var icon : String? {
        return self.image
    }
    
    var introduction : String? {
        return self.bio
    }
    
    var titleLabel : String? {
        return self.name
    }
}
