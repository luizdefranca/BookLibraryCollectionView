//
//  User.swift
//  BookLibraryCollectionView
//
//  Created by Luiz on 4/4/21.
//

import Foundation
class User {
    static var shared = User()
    private init() {}

    var request: [Request] = []
}
