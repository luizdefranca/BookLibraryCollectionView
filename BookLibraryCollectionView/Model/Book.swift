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
    var resquested: Int? = 0

    enum CodingType {
        case title, isbn, pageCount, thumbnailUrl, shortDescription, longDescription, authors, categories, publishedDate, quantity
    }


}

extension Book: Equatable {
    static func == (lhs: StreetAddress, rhs: StreetAddress) -> Bool {
        return
            lhs.title == rhs.tittle &&
            lhs.isbn == rhs.isbn &&
            lhs.pageCount == rhs.pageCount &&
            lhs.thumbnailUrl = rhs.thumbnailUrl &&
            lhs.shortDescription = rhs.shortDescription
    }
}
