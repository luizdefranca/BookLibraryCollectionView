//
//  Book.swift
//  BookLibraryCollectionView
//
//  Created by Luiz on 3/26/21.
//

import Foundation

struct Book: Codable {
    var title: String
    var isbn: String?
    var pageCount: Int
    var thumbnailUrl: URL?
    var shortDescription: String?
    var longDescription: String?
    var authors: [String]
    var categories: [String]
    var publishedDate: Date?
    var quantity: Int
}
