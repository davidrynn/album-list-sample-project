//
//  AlbumTableViewCell.swift
//  NikeSampleProject
//
//  Created by David Rynn on 12/11/20.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    func configure(_ cellViewModel: AlbumCellViewModel, imageLoader: ImageLoaderProtocol) {
        self.textLabel?.text = cellViewModel.albumName
        self.detailTextLabel?.text = cellViewModel.artistName
        self.imageView?.image = UIImage(systemName: "photo")
        imageLoader.loadImage(urlString: cellViewModel.artUrl) { image in
            DispatchQueue.main.async {
                self.imageView?.image = image
                self.reloadInputViews()
            }
        }
    }

}
