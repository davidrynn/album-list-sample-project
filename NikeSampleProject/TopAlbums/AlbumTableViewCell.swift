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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var artistLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ cellViewModel: AlbumCellViewModel, imageLoader: ImageLoaderProtocol) {
        selectionStyle = .none
        layoutViews()
        self.titleLabel.text = cellViewModel.albumName
        self.artistLabel.text = cellViewModel.artistName
        self.activityView.startAnimating()
        imageLoader.loadImage(urlString: cellViewModel.artUrl) { image in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.albumView.image = image
                self.activityView.stopAnimating()
                self.reloadInputViews()
            }
        }
    }

    private func layoutViews() {
        addSubview(activityView)
        addSubview(albumView)
        addSubview(titleLabel)
        addSubview(artistLabel)
        bringSubviewToFront(albumView)
        bringSubviewToFront(activityView)
        let verticalPad: CGFloat = 12
        let horizontalPad: CGFloat = 15
        NSLayoutConstraint.activate([
            albumView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            albumView.widthAnchor.constraint(equalToConstant: 40),
            albumView.heightAnchor.constraint(equalToConstant: 40),
            albumView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            activityView.centerXAnchor.constraint(equalTo: albumView.centerXAnchor),
            activityView.centerYAnchor.constraint(equalTo: albumView.centerYAnchor),

            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -verticalPad),
            titleLabel.leadingAnchor.constraint(equalTo: self.albumView.trailingAnchor, constant: horizontalPad),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),

            artistLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: verticalPad),
            artistLabel.leadingAnchor.constraint(equalTo: self.albumView.trailingAnchor, constant: horizontalPad),
            artistLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])

    }

}
