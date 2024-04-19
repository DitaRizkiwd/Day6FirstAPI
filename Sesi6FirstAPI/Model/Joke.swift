//
//  Joke.swift
//  Sesi6FirstAPI
//
//  Created by MACBOOK PRO on 19/04/24.
//

import Foundation
//codable untuk parsing data api, encoding dan decoding
struct Joke : Codable, Identifiable{
    var id : Int
    var type : String
    var setup : String
    var punchline : String
}
