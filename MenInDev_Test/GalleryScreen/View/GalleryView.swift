//
//  GalleryView.swift
//  MenInDev_Test
//
//  Created by Eugene on 19.09.2022.
//

import Foundation
import UIKit

protocol GalleryViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

class GalleryView: UITableViewController {
    
    var presenter: GalleryPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(FirstGalleryItemCell.self, forCellReuseIdentifier: FirstGalleryItemCell.identifier)
        tableView.register(GalleryItemCell.self, forCellReuseIdentifier: GalleryItemCell.identifier)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        
        self.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        presenter?.getGalleryItems()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.galleryItems.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = presenter?.galleryItems[indexPath.row] else { return UITableViewCell() }
        
        if indexPath.row < 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstGalleryItemCell.identifier, for: indexPath) as? FirstGalleryItemCell else {
                return UITableViewCell()
            }
            cell.configureCell(data)
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GalleryItemCell.identifier, for: indexPath) as? GalleryItemCell else {
            return UITableViewCell()
        }
        cell.configureCell(data)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let item = presenter?.galleryItems[indexPath.row] else { return }
        let galleryDetailView = Builder.buildGalleryDetailModule(with: item)
        self.navigationController?.pushViewController(galleryDetailView, animated: true)
    }
    
}

extension GalleryView: GalleryViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        let alert = UIAlertController(title: "Unable to get data", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
}
