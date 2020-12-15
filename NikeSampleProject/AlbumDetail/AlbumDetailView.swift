//
//  AlbumDetailView.swift
//  NikeSampleProject
//
//  Created by David Rynn on 12/14/20.
//

import UIKit

class AlbumDetailView: UIView {
    
    private let imageLoader: ImageLoaderProtocol
    private let viewModel: AlbumDetailViewModel
    
    private lazy var albumLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.boldSystemFont(ofSize: 25)
        return view
    }()
    
    private lazy var artistLabel: UILabel = {
        let view = UILabel()
        view.textColor = .appleRed
        view.font = UIFont.systemFont(ofSize: 25)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var genreLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = UIFont.systemFont(ofSize: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var copyrightLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 8)
        view.textColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero)
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 5
        return view
    }()
    
    private lazy var button: UIButton = {
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
    
    override func willMove(toSuperview: UIView?) {
        super.willMove(toSuperview: toSuperview)
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
    
    // MARK: - View layout
    
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
        genreLabel.text = viewModel.genres
        copyrightLabel.text = viewModel.copyright
    }
    
    private func setupConstraints() {
        let horizontalPadding: CGFloat = 15
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20.0),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.40),
            
            albumLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            albumLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            albumLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalPadding),
            albumLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
            
            artistLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor),
            artistLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            artistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalPadding),
            artistLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
            
            genreLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor),
            genreLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalPadding),
            genreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
            
            copyrightLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 5),
            copyrightLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            copyrightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalPadding),
            copyrightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
            
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func didTapButton() {
        if let url = URL(string: viewModel.url) {
            UIApplication.shared.open(url)
        }
    }
    
}
