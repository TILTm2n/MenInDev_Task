//
//  PostsTableCell.swift
//  MenInDev_Test
//
//  Created by Eugene on 21.09.2022.
//

import UIKit
import SDWebImage

class PostsTableCell: UITableViewCell {
    
    static var identifier = "PostsTableCell"
    
    private var isLiked = false
    private var amountOfLikes = 0
    
    private let chatContainer = UIView()
    private let bottomContainer = UIView()
    private let likeContainer = UIView()
    private let dateLabel: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.font = .systemFont(ofSize: 13)
        date.text = "17 марта 2022"
        date.textColor = UIColor(named: "DateColor")
        return date
    }()
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 17)
        title.textColor = UIColor(named: "TextColor")
        title.textAlignment = .left
        title.text = "What this does is provide the table view with a temporary estimate/placeholder for the row heights of cells that are not yet onscreen. Then, when these cells are about to scroll on screen, the actual row height will be calculated."
        return title
    }()
    private let postImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "PostImage")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    private let previewLabel: UILabel = {
        let preview = UILabel()
        preview.translatesAutoresizingMaskIntoConstraints = false
        preview.font = .systemFont(ofSize: 15)
        preview.textColor = UIColor(named: "TextColor")
        preview.numberOfLines = 0
        preview.lineBreakMode = .byWordWrapping
        preview.text = "FHKJHKfdjfkldjfla fsdkf;a ffkl fdal;l dlkfjadslfjfj fljadl;fa... gs;lgks;gk; kg;fk;fgag"
        return preview
    }()
    private let moreButton: UIButton = {
        let more = UIButton()
        let attributedString = NSMutableAttributedString.init(string: "Apply UnderLining")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length))
        more.translatesAutoresizingMaskIntoConstraints = false
        more.titleLabel?.font = .systemFont(ofSize: 15)
        more.titleLabel?.attributedText = attributedString
        more.setTitle("Читать далее", for: .normal)
        more.setTitleColor(.red, for: .normal)
        more.titleLabel?.textAlignment = .left
        more.contentHorizontalAlignment = .leading
        return more
    }()
    private let likeButton: UIButton = {
        let like = UIButton()
        like.translatesAutoresizingMaskIntoConstraints = false
        like.setImage(UIImage(named: "notLiked"), for: .normal)
        return like
    }()
    private let likeCounter: UILabel = {
        let counter = UILabel()
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.text = "0"
        return counter
    }()
    private let chatButton: UIButton = {
        let chat = UIButton()
        chat.translatesAutoresizingMaskIntoConstraints = false
        chat.setImage(UIImage(named: "comment"), for: .normal)
        return chat
    }()
    private let chatCounter: UILabel = {
        let counter = UILabel()
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.text = "0"
        return counter
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(dateLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(postImage)
        contentView.addSubview(previewLabel)
        contentView.addSubview(moreButton)
        contentView.addSubview(bottomContainer)
        contentView.addSubview(likeContainer)
        contentView.addSubview(likeButton)
        contentView.addSubview(likeCounter)
        contentView.addSubview(chatContainer)
        contentView.addSubview(chatButton)
        contentView.addSubview(chatCounter)
        
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        likeContainer.translatesAutoresizingMaskIntoConstraints = false
        chatContainer.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        ///dateLabel
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dateLabel.heightAnchor.constraint(equalToConstant: 18),
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        ///dateLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        ///postImage
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalToConstant: 300),
            postImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        ///previewLabel
        NSLayoutConstraint.activate([
            previewLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 12),
            previewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            previewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
        ///moreButton
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(equalTo: previewLabel.bottomAnchor),
            moreButton.heightAnchor.constraint(equalToConstant: 20),
            moreButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        ///bottomContainer
        NSLayoutConstraint.activate([
            bottomContainer.heightAnchor.constraint(equalToConstant: 60),
            bottomContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bottomContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            bottomContainer.topAnchor.constraint(equalTo: moreButton.bottomAnchor),
            bottomContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        ///likeContainer
        NSLayoutConstraint.activate([
            likeContainer.heightAnchor.constraint(equalToConstant: 30),
            likeContainer.widthAnchor.constraint(equalToConstant: contentView.frame.size.width / 4),
            likeContainer.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor),
            likeContainer.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor),
        ])
        ///likeButton
        NSLayoutConstraint.activate([
            likeButton.heightAnchor.constraint(equalToConstant: 24),
            likeButton.widthAnchor.constraint(equalToConstant: 24),
            likeButton.leadingAnchor.constraint(equalTo: likeContainer.leadingAnchor),
            likeButton.centerYAnchor.constraint(equalTo: likeContainer.centerYAnchor)
        ]) 
        ///likeCounter
        NSLayoutConstraint.activate([
            likeCounter.heightAnchor.constraint(equalToConstant: 24),
            likeCounter.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 7),
            likeCounter.centerYAnchor.constraint(equalTo: likeContainer.centerYAnchor)
        ])
        ///chatContainer
        NSLayoutConstraint.activate([
            chatContainer.heightAnchor.constraint(equalToConstant: 30),
            chatContainer.widthAnchor.constraint(equalToConstant: contentView.frame.size.width / 4),
            chatContainer.leadingAnchor.constraint(equalTo: likeContainer.trailingAnchor),
            chatContainer.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor),
        ])
        ///chatButton
        NSLayoutConstraint.activate([
            chatButton.heightAnchor.constraint(equalToConstant: 24),
            chatButton.widthAnchor.constraint(equalToConstant: 24),
            chatButton.leadingAnchor.constraint(equalTo: chatContainer.leadingAnchor, constant: 0),
            chatButton.centerYAnchor.constraint(equalTo: chatContainer.centerYAnchor)
        ])
        ///chatCounter
        NSLayoutConstraint.activate([
            chatCounter.heightAnchor.constraint(equalToConstant: 24),
            chatCounter.leadingAnchor.constraint(equalTo: chatButton.trailingAnchor, constant: 7),
            chatCounter.centerYAnchor.constraint(equalTo: chatContainer.centerYAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCellContent(_ post: Post) {
        dateLabel.text = post.publishedAt
        titleLabel.text = post.title
        postImage.sd_setImage(with: URL(string: post.media[0].original))
        previewLabel.text = post.description
        likeCounter.text = "\(post.likeCount)"
        chatCounter.text = "\(post.commentCount)"
    }

}
