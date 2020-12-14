//
//  AlbumDetailView.swift
//  NikeSampleProject
//
//  Created by David Rynn on 12/14/20.
//

import UIKit

class AlbumDetailView: UIView {

    let imageLoader: ImageLoaderProtocol
    let viewModel: AlbumDetailViewModel

    lazy var albumLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var artistLabel: UILabel = {
        let view = UILabel()
        view.textColor = .appleRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var genreLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = UIFont.systemFont(ofSize: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var copyrightLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 8)
        view.textColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.contentMode = .center
        view.lineBreakMode = .byWordWrapping
        return view
    }()

    lazy var imageView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero)
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 5
        return view
    }()

    lazy var button: UIButton = {
        let view = UIButton(frame: CGRect.zero)
        view.setTitle("More Album Info", for: .normal)
        view.backgroundColor = .appleRed
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return view
    }()

    init(viewModel: AlbumDetailViewModel, imageLoader: ImageLoaderProtocol){
        self.imageLoader = imageLoader
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupViews()
        setupConstraints()
        loadImage()
    }

    private func loadImage() {
        self.imageLoader.loadImage(urlString: viewModel.artworkUrl, completion: { image in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        })
    }

    private func setupViews() {
        backgroundColor = .white
        addSubview(albumLabel)
        addSubview(imageView)
        addSubview(artistLabel)
        addSubview(genreLabel)
        addSubview(copyrightLabel)
        addSubview(button)
        albumLabel.text = viewModel.name
        artistLabel.text = viewModel.artistName
        var texts = [String]()
        viewModel.genres.forEach { genre in
            texts.append(genre.name)
        }
        let genreText = texts.joined(separator: ", ")
        genreLabel.text = genreText
        copyrightLabel.text = viewModel.copyright
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.44),

            albumLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            albumLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            artistLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor),
            artistLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            genreLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor),
            genreLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            copyrightLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor),
            copyrightLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc private func didTapButton() {
        if let url = URL(string: viewModel.url) {
            UIApplication.shared.open(url)
        }
    }
    
}
