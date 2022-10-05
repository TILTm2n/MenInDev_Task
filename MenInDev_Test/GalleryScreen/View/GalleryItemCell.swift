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
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor(red: 0.153, green: 0.153, blue: 0.161, alpha: 1)
        title.font = .systemFont(ofSize: 15)
        title.text = "Fhdjfkadfnk ajfjnsjkldfn  dfhjffala hkgkjgkj"
        title.lineBreakMode = .byWordWrapping
        return title
    }()
    private let date: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        date.textColor = UIColor(red: 0.6, green: 0.62, blue: 0.663, alpha: 1)
        date.text = "29.09.2022"
        return date
    }()
    private let city: UILabel = {
        let city = UILabel()
        city.translatesAutoresizingMaskIntoConstraints = false
        city.textColor = UIColor(red: 0.6, green: 0.62, blue: 0.663, alpha: 1)
        city.font = .systemFont(ofSize: 13)
        city.text = "Obninsk"
        return city
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(contentContainer)
        contentContainer.addSubview(image)
        contentContainer.addSubview(date)
        contentContainer.addSubview(city)
        contentContainer.addSubview(title)
        
        selectionStyle = .none
        
        setConstraints()
        
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowColor = UIColor.gray.cgColor
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
            contentContainer.heightAnchor.constraint(equalToConstant: 120),
            contentContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            contentContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            contentContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalTo: contentContainer.heightAnchor),
            image.widthAnchor.constraint(equalToConstant: 106),
            image.centerYAnchor.constraint(equalTo: contentContainer.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            date.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            date.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            date.heightAnchor.constraint(equalToConstant: 18),
            date.widthAnchor.constraint(equalToConstant: 93)
        ])
        NSLayoutConstraint.activate([
            city.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: 15),
            city.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            city.heightAnchor.constraint(equalToConstant: 18),
            city.topAnchor.constraint(equalTo: date.topAnchor)
        ])
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 4),
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16)
        ])
    }
    
    func configureCell(_ item: GalleryItem) {
        image.sd_setImage(with: URL(string: item.preview.original))
        title.text = item.title
        date.text = item.date
        city.text = item.city
    }

}
