//
//  GalleryDetailView.swift
//  MenInDev_Test
//
//  Created by Eugene on 30.09.2022.
//

import UIKit
import Foundation

protocol GalleryDetailViewProtocol: AnyObject {
    func onUpdate()
}

class GalleryDetailView: UIViewController {
    
    var presenter: GalleryDetailPresenterProtocol?
    
    private var collectionView = UICollectionView (frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let contentContainer: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.984, alpha: 1)
        content.clipsToBounds = true
        return content
    }()
    
    let detailTitle: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.font = .systemFont(ofSize: 17 )
        title.text = "ddfadjglsj gjfkljsgl fgl jflgj;lsfgjl  JKLJLJlll sgk"
        title.lineBreakMode = .byWordWrapping
        return title
    }()
    let date: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.font = .systemFont(ofSize: 13)
        date.textColor = UIColor(red: 0.6, green: 0.62, blue: 0.663, alpha: 1)
        date.text = "-"
        return date
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GalleryDetailCell.self, forCellWithReuseIdentifier: GalleryDetailCell.identifier)
        collectionView.backgroundColor = UIColor(named: "light")
        view.addSubview(collectionView)
        self.collectionView = collectionView
        
        view.addSubview(contentContainer)
        contentContainer.addSubview(date)
        contentContainer.addSubview(detailTitle)
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.title = "Фотоотчет"
        
        onUpdate()
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        //Item
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(2/3),
            heightDimension: .fractionalWidth(0.6))
        )
        let verticalStackItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1/2))
        )
        
        //Group
        let verticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
                                               heightDimension: .fractionalHeight(1)),
            subitem: verticalStackItem,
            count: 2)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(3/5)),
            subitems: [
                item,
                verticalStackGroup
            ])
        
        //Sections
        let section = NSCollectionLayoutSection(group: group)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

        //return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let navigationController = navigationController?.navigationBar else { return }
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentContainer.bottomAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentContainer.topAnchor.constraint(equalTo: navigationController.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            detailTitle.topAnchor.constraint(equalTo: contentContainer.topAnchor, constant: 10),
            detailTitle.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 16),
            detailTitle.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -16),
        ])
        NSLayoutConstraint.activate([
            date.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 16),
            date.widthAnchor.constraint(equalTo: contentContainer.widthAnchor),
            date.bottomAnchor.constraint(equalTo: contentContainer.bottomAnchor, constant: -16),
            date.topAnchor.constraint(equalTo: detailTitle.bottomAnchor, constant: 10)
        ])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
}

extension GalleryDetailView: GalleryDetailViewProtocol {
    func onUpdate() {
        guard let data = presenter?.galleryItem else { return }
        detailTitle.text = data.title
        date.text = "\(data.date), \(data.city)"
        //city.text = data.city
        self.collectionView.reloadData()
    }
}


extension GalleryDetailView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.galleryItem?.attachments.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryDetailCell.identifier, for: indexPath) as? GalleryDetailCell else { return UICollectionViewCell() }
        guard let image = presenter?.galleryItem?.attachments[indexPath.row].original else { return UICollectionViewCell() }
        cell.setImage(with: image)
        
        return cell
    }
    
}
