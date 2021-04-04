//
//  ViewController.swift
//  BookLibraryCollectionView
//
//  Created by Luiz on 3/26/21.
//

import UIKit
import Nuke

class LibraryViewController: UIViewController {

    let reuseIdentifierCollectionCell = "BookCell"
    let preheater = ImagePreheater()
    @IBOutlet weak var collectionView: UICollectionView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
    
        let nib = UINib(nibName: reuseIdentifierCollectionCell, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifierCollectionCell)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.prefetchDataSource = self
    }


}

extension LibraryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Library.shared.books.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCollectionCell, for: indexPath) as! BookCell

        let book = Library.shared.books[indexPath.row]
        cell.configure(book: book)

        return cell
    }
}

extension LibraryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let columns: CGFloat = 3
        let verticalInset: CGFloat = 16
        let spacing: CGFloat = 10
        let availableWidth = screenWidth - (verticalInset * 2) - (spacing * (columns - 1))
        let cellWidth = floor(availableWidth / columns)
        let cellHeight: CGFloat = 160
        print("screen width: \(screenWidth)")
        print("cell width: \(cellWidth)")
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension LibraryViewController:  UICollectionViewDataSourcePrefetching {

    // MARK: UICollectionViewDataSourcePrefetching

    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let urls = indexPaths.compactMap { indexPath in
            Library.shared.books[indexPath.row].thumbnailUrl
        }

        preheater.startPreheating(with: urls)
    }

    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {

        let urls = indexPaths.compactMap { indexPath in
            Library.shared.books[indexPath.row].thumbnailUrl
        }

        preheater.stopPreheating(with: urls)
    }



}
