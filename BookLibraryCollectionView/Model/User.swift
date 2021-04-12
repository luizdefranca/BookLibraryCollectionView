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

    private var requestList: [Request] = []

    func addRequest(book : Book){
        let request = Request(book: book, loanDate: Date.init())
        requestList.append(request)
    }

    func removeRequest(book : Book){
        if let index  =  requestList.firstIndex(where: {$0.book == book}){
            requestList.remove(at: index)
        }
    }
    
    func numberOfRequest() -> Int { return requestList.count}

    func getRequestList() -> [Request]{ return requestList}

    func getBorrowedBooks() -> [Book]{
        return requestList.map({$0.book })
    }
}
