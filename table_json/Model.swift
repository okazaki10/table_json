//
//  Model.swift
//  table_json
//
//  Created by Rakha A on 15/06/22.
//

import Foundation

struct Result:Codable{
    let shortDescription: String?
    let thumbnailUrl: String?
    let title: String
    let isbn: String?
}
