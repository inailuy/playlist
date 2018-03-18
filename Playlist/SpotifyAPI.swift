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
    typealias CompletionHandler = (_ data:Data) -> Void
    
    func grabPlaylist(completionHandler: @escaping CompletionHandler) {
        guard let auth = SpotifyLogin.shared.authToken else {
            print("wrong")
            return
        }
        
        let url = self.createURLWithComponents(path: playlistPath)
        let headers: HTTPHeaders = self.createHeader(auth: auth)
        
        Alamofire.request(url!, headers: headers).responseJSON { response in
            guard let data = response.data else {
                fatalError("error on response")
            }
            
            completionHandler(data)
        }
    }
    
    func createURLWithComponents(path: String) -> URL? {
        let urlComponents = NSURLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = apiUrl
        urlComponents.path = path
        
        return urlComponents.url!
    }
    
    func createHeader(auth:String ) -> HTTPHeaders {
        return [
            "Authorization": "Bearer \(auth)",
            "Accept": "application/json"
        ]
    }
}
