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
        
//        contentView.layer.borderColor = UIColor.blue.cgColor
//        contentView.layer.borderWidth = 2
        
//        layer.borderColor = UIColor.blue.cgColor
//        layer.borderWidth = 2
        
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
    
}

//extension UIView {
//
//    enum Borders {
//        case top
//        case bottom
//        case left
//        case right
//    }
//
//    func addBorders(_ side: Borders, _ color: UIColor, _ width: CGFloat) {
//        let border = UIView()
//        border.translatesAutoresizingMaskIntoConstraints = false
//        border.backgroundColor = color
//        self.addSubview(border)
//
//        switch side {
//        case .top:
//            border.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
//            border.heightAnchor.constraint(equalToConstant: width).isActive = true
//            border.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//            //border.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        case .bottom:
//            border.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
//            border.heightAnchor.constraint(equalToConstant: width).isActive = true
//            border.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//            //border.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        case .left:
//            border.widthAnchor.constraint(equalToConstant: width).isActive = true
//            border.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
//            //border.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//            border.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        case .right:
//            border.widthAnchor.constraint(equalToConstant: width).isActive = true
//            border.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
//            //border.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//            border.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        }
//
//    }
//}

