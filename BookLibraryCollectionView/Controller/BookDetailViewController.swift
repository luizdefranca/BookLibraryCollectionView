//
//  BookDetailViewController.swift
//  BookLibraryCollectionView
//
//  Created by Luiz on 4/4/21.
//

import UIKit
import Nuke

class BookDetailViewController: UIViewController {

    @IBOutlet weak var imageViewBook: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelISBN: UILabel!
    @IBOutlet weak var labelPublished: UILabel!
    @IBOutlet weak var labelCategories: UILabel!
    @IBOutlet weak var labelDescription: UITextView!
    @IBOutlet weak var labelAvailableBook: UILabel!
    @IBOutlet weak var buttonBorrow: UIButton!


    var book: Book?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("______***********______")
        dump(book)
        setupScreen()
    }
    func setupScreen(){
        guard let book = book else { return }
        loadImage(imageURL: book.thumbnailUrl, imageView: imageViewBook)
        labelTitle.text = "\(book.title)"
        labelISBN.text = "ISBN: \(book.isbn ?? "")"
        labelAuthor.text = "\(book.authors.joined(separator: ", "))"
        labelDescription.text = book.shortDescription
        labelCategories.text = "Categories: \(book.categories.joined(separator: ","))"
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        if let publishedDate = book.publishedDate {
            labelPublished.text = "Publised: \(dateFormatter.string(from: publishedDate))"
        }
    }

    func loadImage(imageURL: URL?, imageView: UIImageView){
        imageView.image = ImageLoadingOptions.shared.placeholder
        imageView.contentMode = .scaleAspectFit

        guard let imageURL = imageURL else {
            return
        }
        ImagePipeline.shared.loadImage(
          with: imageURL) { [weak self] response in 
          guard let self = self else {
            return
          }

          switch response {
          case .failure:
            imageView.image = ImageLoadingOptions.shared.failureImage
            imageView.contentMode = .scaleAspectFit
          case let .success(imageResponse):
            imageView.image = imageResponse.image
            imageView.contentMode = .scaleAspectFill
          }
        }
    }
}
