//
//  LibraryCollectionViewCell.swift
//  BookLibraryCollectionView
//
//  Created by Luiz on 3/26/21.
//

import UIKit
import Nuke

class BookCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(book: Book){
        titleLabel.text = book.title
        if let url = book.thumbnailUrl {
            let options = ImageLoadingOptions(
              placeholder: UIImage(systemName: "book"),
              transition: .fadeIn(duration: 0.5)
            )
            Nuke.loadImage(with: url,options: options, into: imageView)
            //            imageView.load(url: url)
        }

    }
}
