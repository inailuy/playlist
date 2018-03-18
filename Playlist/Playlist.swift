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
    
//    private enum CodingKeys: String, CodingKey {
//        case limit
//        case href
//        case previous
//        case offset
//        case next
//        case total
//        case items
//    }
//
//    init(limit: Int, href: String, previous: String, offset: Int, next: String, total: Int, items:Array<Any>) {
//        self.limit = limit
//        self.href = href
//        self.previous = previous
//        self.offset = offset
//        self.next = next
//        self.total = total
//        self.items = items
//    }
//
//    init(from decoder:Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        limit = try values.decode(Int.self, forKey: .limit)
//        href = try values.decode(String.self, forKey: .href)
//        //previous = try values.decode(String.self, forKey: .previous)
//        offset = try values.decode(Int.self, forKey: .offset)
//        next = try values.decode(String.self, forKey: .next)
//        total = try values.decode(Int.self, forKey: .total)
//        //items = try values.decode(Array<Any>.self, forKey: .items)
//    }
}

struct Item: Codable {
    var href :String
    var id :String
    var name :String
    var snapshot_id :String
    //var type :String
    //var publicString :Bool
    //var collaborative :Bool
    //var uri :String
}

