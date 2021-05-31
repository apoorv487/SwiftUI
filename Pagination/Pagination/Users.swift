//
//  Users.swift
//  Pagination
//
//  Created by Apoorv Garg on 17/04/21.
//

import Foundation

struct Users : Decodable{
    let page : Int
    let perPage : Int
    let total: Int
    let totalPages : Int
    let data : [User]
}

struct User : Decodable, Hashable{
    let id : Int
    let email : String
    let firstName : String
    let lastName : String
    let avatar : URL
}
