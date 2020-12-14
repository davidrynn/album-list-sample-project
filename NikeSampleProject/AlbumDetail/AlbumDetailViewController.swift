//
//  AlbumDetailViewController.swift
//  NikeSampleProject
//
//  Created by David Rynn on 12/12/20.
//

import UIKit

final class AlbumDetailViewController: UIViewController {

    let detailView: AlbumDetailView

    init(viewModel: AlbumDetailViewModel, imageLoader: ImageLoaderProtocol) {
        self.detailView = AlbumDetailView(viewModel: viewModel, imageLoader: imageLoader)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        self.view.addSubview(detailView)
        detailView.frame = view.frame
    }

}
