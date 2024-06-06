//
//  Product.swift
//  FakeStoreApiMVVMAproach
//
//  Created by Buhle Radzilani on 2024/06/06.
//

import Foundation

//in swift when you conform a struct or class to Decodable you allow it to be initialized from JSON object or other formats. 

struct Product: Decodable{
    let id: Int
    let title: String
    let price: Double
}
