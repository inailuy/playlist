//
//  PlaylistVM.swift
//  Playlist
//
//  Created by yulz on 3/17/18.
//  Copyright © 2018 yulz. All rights reserved.
//

import Foundation

class PlaylistVM {
    var playlists  = [Item]()
    
    typealias CompletionHandler = (_ success:Bool) -> Void
    func setUp(completionHandler: @escaping CompletionHandler) {
        let api = SpotifyAPI()
        api.grabPlaylist(completionHandler: {  data in
            guard let playlistObject = try? JSONDecoder().decode(Playlist.self, from: data) else {
                print("Error: Couldn't decode data into playlist")
                return
            }
            
            let succes = playlistObject.items.count > 0 ? true : false
            self.playlists = playlistObject.items
            completionHandler(succes)
        })
    }
}
