//
//  Playlist.swift
//  Playlist
//
//  Created by yulz on 3/12/18.
//  Copyright © 2018 yulz. All rights reserved.
//

import Foundation

struct Playlist: Decodable {
    let limit :Int
    let href :String
    let offset :Int
    let next :String
    let total :Int
    let items :[Item]
}

struct Item: Codable {
    var href :String
    var id :String
    var name :String
    var snapshot_id :String
}
