//
//  LibraryManager.swift
//  BookLibraryCollectionView
//
//  Created by Luiz on 4/8/21.
//

import Foundation

class LibraryManager {
//    let shared = LibraryManager()
    private let categories = Category.AllCases()
    var categoryList : [Category : [Book]]
    
    init(){
        self.categoryList = [Category : [Book]] ()
        for category in Category.AllCases() {
            categoryList[category] = [Book]()
        }
        createListWithCategories()
    }
//    static func shared() -> LibraryManager {
//
//
//        return libraryManager
//    }

    
    func lendBookBy(user : User, book :Book) {
        user.addRequest(book: book)
    }

    func fetchLentBooksBy(user : User) -> [Request]{
        user.getRequestList()
    }

    func fetchBookBy(category: Category) -> [Book]?{
        return categoryList[category]
    }

    func getCategories() -> [Category] {
        let categories = Category.AllCases()
        return categories
    }

    func listResquestedBooks(user: User) -> [Book]{
        return user.getBorrowedBooks()
    }

    func createListWithCategories()  {
        let books = Library.shared.books

        books.forEach { book  in
            if book.categories.count > 0 {
                for categoryString in book.categories {
                    if let category = Category.init(rawValue: categoryString){
                        categoryList[category]?.append(book)
                    } else {
                        let category = Category.other
                        categoryList[category]?.append(book)
                    }
                }
            }
        }
    }
}
