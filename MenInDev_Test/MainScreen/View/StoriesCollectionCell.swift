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
    var storyTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let icon = UIImageView(image: UIImage(named: "StoryIcon"))
        icon.translatesAutoresizingMaskIntoConstraints = false
        storyIcon = icon
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 13)
        title.text = "Story"
        title.textAlignment = .center
        storyTitle = title
        
        container.addSubview(icon)
        container.addSubview(title)
        
        contentView.addSubview(container)
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            container.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        ])
        NSLayoutConstraint.activate([
            storyIcon.widthAnchor.constraint(equalToConstant: 52),
            storyIcon.heightAnchor.constraint(equalToConstant: 52),
            storyIcon.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            storyIcon.topAnchor.constraint(equalTo: container.topAnchor)
        ])
        NSLayoutConstraint.activate([
            storyTitle.topAnchor.constraint(equalTo: storyIcon.bottomAnchor),
            storyTitle.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            storyTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            storyTitle.heightAnchor.constraint(equalToConstant: 18),
            storyTitle.centerXAnchor.constraint(equalTo: container.centerXAnchor)
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureStoryCell(_ story: Story) {
        storyTitle.text = story.title
        guard let media = story.media else { return }
        storyIcon.sd_setImage(with: URL(string: media.original), placeholderImage: UIImage(named: "StoryIcon"))
    }
    
}

