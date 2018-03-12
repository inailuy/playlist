//
//  SpotifyAPI.swift
//  Playlist
//
//  Created by yulz on 3/11/18.
//  Copyright © 2018 yulz. All rights reserved.
//

import Foundation
import Alamofire
import SpotifyLogin

let apiUrl = "api.spotify.com"
let playlistPath = "/v1/me/playlists"

class SpotifyAPI {
    
    func grabPlaylist() {
        guard let auth = SpotifyLogin.shared.authToken else {
            print("wrong")
            return
        }
        
        let url = self.createURLWithComponents(path: playlistPath)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(auth)",
            "Accept": "application/json"
        ]
        
        Alamofire.request(url!, headers: headers).responseJSON { response in
            debugPrint(response.result)
        }
    }
    
    func createURLWithComponents(path: String) -> URL? {
        let urlComponents = NSURLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = apiUrl
        urlComponents.path = path
        
        return urlComponents.url!
    }
}

