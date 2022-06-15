//
//  Model.swift
//  table_json
//
//  Created by Rakha A on 15/06/22.
//

import Foundation

struct Result:Codable{
    let author: String
    let country: String
    let imageLink: String
    let language: String
    let link: String
    let pages: Int
    let title: String
    let year: Int
}
