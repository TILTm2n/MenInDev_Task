//
//  GalleryItemCell.swift
//  MenInDev_Test
//
//  Created by Eugene on 29.09.2022.
//

import UIKit

class FirstGalleryItemCell: UITableViewCell {

    static var identifier = "FirstGalleryItemCell"
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "default")
        image.clipsToBounds = true
        return image
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.font = .systemFont(ofSize: 24)
        title.text = "ddfadjglsj gjfkljsgl fgl jflgj;lsfgjl  JKLJLJlll sgk"
        return title
    }()
    
    let date: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.textColor = .white
        date.font = .systemFont(ofSize: 18)
        date.text = "29.09.2022"
        return date
    }()
    
    let city: UILabel = {
        let city = UILabel()
        city.translatesAutoresizingMaskIntoConstraints = false
        city.textColor = .white
        city.font = .systemFont(ofSize: 18)
        city.text = "Obninsk"
        return city
    }()
    
    private let contentContainer: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.clipsToBounds = true
        return content
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(image)
        image.addSubview(contentContainer)
        contentContainer.addSubview(date)
        contentContainer.addSubview(title)
        contentContainer.addSubview(city)
        
        selectionStyle = .none
        
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            contentContainer.heightAnchor.constraint(equalToConstant: 70),
            contentContainer.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            contentContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            contentContainer.bottomAnchor.constraint(equalTo: image.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            image.heightAnchor.constraint(equalToConstant: 278),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            date.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 16),
            date.widthAnchor.constraint(equalToConstant: 100),
            date.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -16),
            date.heightAnchor.constraint(equalToConstant: 18)
        ])
        NSLayoutConstraint.activate([
            city.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: 10),
            city.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -16),
            city.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -16),
            city.heightAnchor.constraint(equalToConstant: 18)
        ])
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentContainer.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -16),
            title.bottomAnchor.constraint(equalTo: date.topAnchor, constant: 8)
        ])
        
    }
    
    func configureCell(_ item: GalleryItem) {
        image.sd_setImage(with: URL(string: item.preview.original))
        title.text = item.title
        date.text = item.date
        city.text = item.city
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
