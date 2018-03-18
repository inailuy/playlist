//
//  PlaylistVC.swift
//  Playlist
//
//  Created by yulz on 3/17/18.
//  Copyright © 2018 yulz. All rights reserved.
//

import Foundation
import UIKit

let TRACK_SEGUE = "trackSegue"
let CELL_ID = "cellIdentifier"

class PlaylistVC: UITableViewController{
    
    var playlistVM = PlaylistVM()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "My Playlists"
        
        playlistVM.setUp(completionHandler: { [weak self] success in
            // Lets update UI after hitting spotify api
            if success {
                self?.tableView.reloadData()
            } else {
                print("error on playlistvm setup")
            }
        })
    }
    
    //MARK: TABLEVIEW DELEGATE/DATA SOURCE
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: CELL_ID)
        }
     
        cell?.textLabel?.text = playlistVM.playlists[indexPath.row].name
        return cell!
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistVM.playlists.count
    }
}
