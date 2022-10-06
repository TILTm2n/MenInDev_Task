//
//  ViewController.swift
//  MenInDev_Test
//
//  Created by Eugene on 19.09.2022.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

class MainView: UITableViewController {

    var presenter: MainPresenterProtocol?
    
    var storiesCollection = StoriesCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        storiesCollection.delegate = self
        storiesCollection.dataSource = self
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        header.backgroundColor = .yellow
        header.addSubview(storiesCollection)
        NSLayoutConstraint.activate([
            storiesCollection.heightAnchor.constraint(equalTo: header.heightAnchor),
            storiesCollection.widthAnchor.constraint(equalTo: header.widthAnchor),
            storiesCollection.topAnchor.constraint(equalTo: header.topAnchor),
            storiesCollection.centerXAnchor.constraint(equalTo: header.centerXAnchor)
        ])
    
        tableView.estimatedRowHeight = 44
        tableView.tableHeaderView = header
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PostsTableCell.self, forCellReuseIdentifier: PostsTableCell.identifier)
        
        presenter?.getPosts()
        presenter?.getStories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        tabBarController?.tabBar.isHidden = false
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.posts.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableCell.identifier, for: indexPath) as? PostsTableCell else {
            return UITableViewCell()
        }
        guard let post = presenter?.posts[indexPath.row] else { return cell }
        cell.setCellContent(post)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let post = presenter?.posts[indexPath.row] else { return }
        let dvc = Builder.buildDetailModule(post)
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
}

extension MainView: MainViewProtocol {
    func success() {
        tableView?.reloadData()
        storiesCollection.reloadData()
    }
    
    func failure(error: Error) {
        let alert = UIAlertController(title: "Unable to get data", message: "\(error)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel)
        let again = UIAlertAction(title: "try Again", style: .default) { _ in
            self.presenter?.getPosts()
            self.presenter?.getStories()
        }
        alert.addAction(ok)
        alert.addAction(again)
        self.present(alert, animated: true)
    }
}

extension MainView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.stories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCollectionCell.identifier, for: indexPath) as? StoriesCollectionCell else {
            return UICollectionViewCell()
        }
        
        guard let story = presenter?.stories[indexPath.row] else { return UICollectionViewCell() }
        
        cell.configureStoryCell(story)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        storiesCollection.reloadData()
//        print("reload")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}
