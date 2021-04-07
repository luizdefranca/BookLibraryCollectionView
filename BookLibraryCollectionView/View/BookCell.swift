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
        self.tintColor = .black
    }

    func configure(book: Book, cellSize: CGFloat){
        titleLabel.text = book.title
        if let url = book.thumbnailUrl {

            var pixelSize: CGFloat {
              return cellSize * UIScreen.main.scale
            }


            var resizedImageProcessors: [ImageProcessing] {
              let imageSize = CGSize(width: pixelSize, height: pixelSize)
              return [ImageProcessors.Resize(size: imageSize, contentMode: .aspectFill)]
            }

            let request = ImageRequest(
              url: url,
              processors: resizedImageProcessors)

            let options = ImageLoadingOptions(
              placeholder: UIImage(systemName: "book.circle"),
              transition: .fadeIn(duration: 0.5)
            )
            
            Nuke.loadImage(with: request,options: options, into: imageView)
            //            imageView.load(url: url)
        }

    }
}
