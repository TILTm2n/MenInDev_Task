//
//  StoriesCollectionCell.swift
//  MenInDev_Test
//
//  Created by Eugene on 20.09.2022.
//

import UIKit

class StoriesCollectionCell: UICollectionViewCell {
 
    static var identifier = "StoriesCell"

    var container = UIView()
    var storyIcon = UIImageView()
    var storySubtitile = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let icon = UIImageView(image: UIImage(named: "StoryIcon"))
        icon.translatesAutoresizingMaskIntoConstraints = false
        storyIcon = icon
        
        let subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.font = .systemFont(ofSize: 13)
        subtitle.text = "Story"
        subtitle.textAlignment = .center
        storySubtitile = subtitle
        
        container.addSubview(icon)
        container.addSubview(subtitle)
        
        contentView.addSubview(container)
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            storyIcon.widthAnchor.constraint(equalToConstant: 52),
            storyIcon.heightAnchor.constraint(equalToConstant: 52),
            storyIcon.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            storyIcon.topAnchor.constraint(equalTo: container.topAnchor)
        ])
        NSLayoutConstraint.activate([
            storySubtitile.topAnchor.constraint(equalTo: storyIcon.bottomAnchor),
            storySubtitile.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            storySubtitile.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            storySubtitile.heightAnchor.constraint(equalToConstant: 18),
            storySubtitile.centerXAnchor.constraint(equalTo: container.centerXAnchor)
            
        ])
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            container.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func configureCell(_ story: Media) {
//        storyIcon.sd_setImage(with: story.original, placeholderImage: UIImage(named: "StoryIcon"))
//    }
    
}

