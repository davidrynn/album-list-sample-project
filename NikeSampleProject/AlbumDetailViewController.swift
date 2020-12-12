//
//  AlbumDetailViewController.swift
//  NikeSampleProject
//
//  Created by David Rynn on 12/12/20.
//

import UIKit

class AlbumDetailViewController: UIViewController {

    let viewModel: AlbumDetailViewModel

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "photo")
        view.contentMode = .scaleAspectFit
        return view
    }()

    lazy var albumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(viewModel: AlbumDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()

    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(albumLabel)
        view.addSubview(imageView)
        albumLabel.text = viewModel.name

    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.33),

            albumLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            albumLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            albumLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
