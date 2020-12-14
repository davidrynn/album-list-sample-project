//
//  AlbumTableViewCell.swift
//  NikeSampleProject
//
//  Created by David Rynn on 12/11/20.
//

import UIKit

final class AlbumTableViewCell: UITableViewCell {

    lazy var activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var albumView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero)
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ cellViewModel: AlbumCellViewModel, imageLoader: ImageLoaderProtocol) {
        self.imageView?.image = UIImage(systemName: "photo")
        layoutViews()
        self.textLabel?.text = cellViewModel.albumName
        self.detailTextLabel?.text = cellViewModel.artistName
        self.activityView.startAnimating()
        imageLoader.loadImage(urlString: cellViewModel.artUrl) { image in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.imageView?.image = image
                self.activityView.stopAnimating()
                self.reloadInputViews()
            }
        }
    }

    private func layoutViews() {
        addSubview(activityView)
        bringSubviewToFront(activityView)
        if let albumImageView = imageView {
            NSLayoutConstraint.activate([
                activityView.centerXAnchor.constraint(equalTo: albumImageView.centerXAnchor),
                activityView.centerYAnchor.constraint(equalTo: albumImageView.centerYAnchor)
            ])
        }

    }

}
