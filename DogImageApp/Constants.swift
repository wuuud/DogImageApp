//
//  Constants.swift
//  DogImageApp
//
//  Created by H M on 2022/11/02.
//

import Foundation

struct Constants {
    static let shared = Constants()
    private init() {}
    
    let baseUrlStr = "https://dog.ceo/api/breeds/image/random"
}
