//
//  Photo.swift
//  Photo
//
//  Created by nyannyan0328 on 2021/08/03.
//

import SwiftUI

struct Photo: Identifiable,Hashable {
    var id = UUID().uuidString
    var PhotoURL : String
}

