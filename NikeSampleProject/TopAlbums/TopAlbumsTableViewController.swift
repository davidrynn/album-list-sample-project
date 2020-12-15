//
//  TopAlbumsTableViewController.swift
//  NikeSampleProject
//
//  Created by David Rynn on 12/11/20.
//

import UIKit

final class TopAlbumsTableViewController: UITableViewController {
    
    private var viewModel: TopAlbumsViewModel
    private let imageLoader = ImageLoader()
    
    
    init(viewModel: TopAlbumsViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Albums"
        self.tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "albumCell")
        viewModel.loadAlbums(completion: { error in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfAlbums
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath)
        if let cell = cell as? AlbumTableViewCell {
            cell.configure(self.viewModel.cellViewModel(index: indexPath.row), imageLoader: self.imageLoader)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AlbumDetailViewController(viewModel: viewModel.detailViewModel(index: indexPath.row), imageLoader: imageLoader)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
