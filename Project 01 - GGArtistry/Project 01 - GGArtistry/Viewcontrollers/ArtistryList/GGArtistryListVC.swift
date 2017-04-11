//
//  GGArtistryListVC.swift
//  Project 01 - GGArtistry
//
//  Created by viethq on 4/5/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import UIKit
import DynamicColor

final class GGArtistryListVC: UIViewController {
    
    @IBOutlet weak var listTbl: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingUI()
    }
}

//MARK: - style ui
fileprivate extension GGArtistryListVC {
    func settingUI() {
        //
        self.title = "Artistry List"
        
        //
        self.navigationController?.navigationBar.barTintColor = DynamicColor(hexString: "6ba041")
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white,
                                                                        NSFontAttributeName : UIFont.boldSystemFont(ofSize: 20)]
        
        //
        self.listTbl.delegate = self
        self.listTbl.dataSource = self
        
        self.fillData()
    }
}


//MARK: - tableview delegate, datasource
extension GGArtistryListVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK: - common
extension GGArtistryListVC {
    func fillData() {
        print(GGArtistModel.artistsFromBundle() ?? "error")
    }
}
