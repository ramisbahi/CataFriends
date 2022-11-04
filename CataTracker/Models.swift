//
//  Models.swift
//  CataTracker
//
//  Created by Damilola Awofisayo on 11/4/22.
//

import Foundation

struct CataMember: Codable{
    let data: [PersonItem]
}
struct PersonItem: Codable{
    let name: String
    let photo: String
    let questions: [String]
    
}
