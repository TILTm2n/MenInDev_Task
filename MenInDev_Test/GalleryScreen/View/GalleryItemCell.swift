//
//  GalleryItemCell.swift
//  MenInDev_Test
//
//  Created by Eugene on 29.09.2022.
//

import UIKit
import SDWebImage

class GalleryItemCell: UITableViewCell {

    static var identifier = "GalleryItemCell"
    
    private let contentContainer: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.layer.cornerRadius = 20
        content.backgroundColor = .white
        content.clipsToBounds = true
        return content
    }()
    private let descriptionContainer: UIView = {
        let description = UIView()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.backgroundColor = .white
        description.clipsToBounds = true
        return description
    }()
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "default")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        
        return image
    }()
    private let title: UILabel = {
        let title = UILabel()
        title.numberOfLines = 3
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor(red: 0.153, green: 0.153, blue: 0.161, alpha: 1)
        title.font = .systemFont(ofSize: 15, weight: .semibold)
        title.text = "Fhdjfkadfnk ajfjnsjkldfn  dfhjffala hkgkjgkj"
        title.lineBreakMode = .byWordWrapping
        title.sizeToFit()
        return title
    }()
    private let dateCity: UILabel = {
        let dateCity = UILabel()
        dateCity.translatesAutoresizingMaskIntoConstraints = false
        dateCity.textColor = UIColor(red: 0.6, green: 0.62, blue: 0.663, alpha: 1)
        dateCity.font = .systemFont(ofSize: 13, weight: .semibold)
        dateCity.text = "•"
        dateCity.lineBreakMode = .byWordWrapping
        dateCity.numberOfLines = 0
        return dateCity
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(contentContainer)
        contentContainer.addSubview(descriptionContainer)
        contentContainer.addSubview(image)
        descriptionContainer.addSubview(dateCity)
        descriptionContainer.addSubview(title)
        
        selectionStyle = .none
        
        setConstraints()
        
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowRadius = 6
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubviews")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            contentContainer.heightAnchor.constraint(equalToConstant: 106),
            contentContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            contentContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            contentContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalTo: contentContainer.heightAnchor),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            image.centerYAnchor.constraint(equalTo: contentContainer.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            descriptionContainer.topAnchor.constraint(equalTo: contentContainer.topAnchor, constant: 12),
            descriptionContainer.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            descriptionContainer.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -16),
            descriptionContainer.bottomAnchor.constraint(equalTo: contentContainer.bottomAnchor, constant: -10),
        ])
        NSLayoutConstraint.activate([
            dateCity.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor),
            dateCity.topAnchor.constraint(equalTo: descriptionContainer.topAnchor),
            dateCity.heightAnchor.constraint(equalToConstant: 18),
            dateCity.widthAnchor.constraint(equalTo: descriptionContainer.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: dateCity.bottomAnchor, constant: 4),
            title.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor),
        ])
    }
    
    func configureCell(_ item: GalleryItem) {
        image.sd_setImage(with: URL(string: item.preview.original))
        title.text = item.title
        dateCity.text = "\(item.date) • \(item.city)"
        
    }

}
