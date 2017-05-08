//
//  GGArtistryListVC.swift
//  Project 01 - GGArtistry
//
//  Created by viethq on 4/5/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import UIKit
import DynamicColor

/// enum helper
enum XibViewcontroller {
    case workVC
    
    func createVC() -> UIViewController {
        switch self {
        case .workVC:
            let vc = GGWorkDetailVC(nibName: nil, bundle: nil)
            return vc
        }
    }
}

/// 

final class GGArtistryListVC: UIViewController {
    
    @IBOutlet weak var listTbl: UITableView!
    
    /// auto reload when data changed
    var artists = [GGArtistModel]() {
        didSet {
            DispatchQueue.main.async {
                self.listTbl.reloadData()
            }
        }
    }

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
        self.listTbl.register(GGArtistryCell.getNib(), forCellReuseIdentifier: GGArtistryCell.getNibName())
        
        self.listTbl.delegate = self
        self.listTbl.dataSource = self
        
        //
        self.fillData()
    }
}


//MARK: - tableview delegate, datasource
extension GGArtistryListVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GGArtistryCell.getNibName()) as! GGArtistryCell
        
        let item = self.artists[indexPath.row]
        
        cell.displayData(item: item)
        
        cell.introductionLabel.numberOfLines = item.isExpand ? 0 : 3
        cell.detailButton.isHidden = !item.isExpand

        cell.selectionStyle = .none
        
        // navigate to detail viewcontroller
        cell.clickdetailButtonEvent = { [weak self] in
            let workVC = GGWorkDetailVC(nibName: nil, bundle: nil)
            workVC.works = item.works
            
            self?.navigationController!.pushViewController(workVC, animated: true)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // update data
        let item = self.artists[indexPath.row]
        
        item.isExpand = !item.isExpand
        
        // update ui
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}

//MARK: - common
extension GGArtistryListVC {
    func fillData() {
        guard let arr = GGArtistModel.artistsFromBundle() else {
            return
        }
        
        artists = arr
    }
}
