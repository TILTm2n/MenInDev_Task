//
//  DetailView.swift
//  MenInDev_Test
//
//  Created by Eugene on 22.09.2022.
//

import UIKit
import SDWebImage

protocol DetailViewProtocol: AnyObject {
    func onUpdate(_ data: Post?)
}

class DetailView: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: view.bounds)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.contentInsetAdjustmentBehavior = .never
        return scroll
    }()
    private var scrollContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.clipsToBounds = true
        return container
    }()
    private var scrollContent: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    private var footerContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.984, alpha: 1)
        return container
    }()
    private var postImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "default")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    private var dateLabel: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.font = .systemFont(ofSize: 13)
        date.text = "yiojljl;l"
        date.textColor = UIColor(named: "DateColor")
        return date
    }()
    private var titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 17)
        title.textColor = UIColor(named: "TextColor")
        title.textAlignment = .left
        title.text = "kjlljkl;l"
        return title
    }()
    private var content: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 14)
        title.textColor = UIColor(named: "TextColor")
        title.textAlignment = .left
        title.text = "advicer"
        return title
    }()
    private var reactionContainer: UIView = {
        var likeContainer = UIView()
        likeContainer.translatesAutoresizingMaskIntoConstraints = false
        return likeContainer
    }()
    private var likeContainer: UIView = {
        var likeContainer = UIView()
        likeContainer.translatesAutoresizingMaskIntoConstraints = false
        return likeContainer
    }()
    private var likeButton: UIButton = {
        let like = UIButton()
        like.translatesAutoresizingMaskIntoConstraints = false
        like.setImage(UIImage(named: "notLiked"), for: .normal)
        return like
    }()
    private var likeCounter: UILabel = {
        let counter = UILabel()
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.text = "0"
        return counter
    }()
    private var chatContainer: UIView = {
        var chatContainer = UIView()
        chatContainer.translatesAutoresizingMaskIntoConstraints = false
        return chatContainer
    }()
    private var chatButton: UIButton = {
        let chat = UIButton()
        chat.translatesAutoresizingMaskIntoConstraints = false
        chat.setImage(UIImage(named: "comment"), for: .normal)
        return chat
    }()
    private var chatCounter: UILabel = {
        let counter = UILabel()
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.text = "0"
        return counter
    }()
    private var messageContainer: UIView = {
        var chatContainer = UIView()
        chatContainer.translatesAutoresizingMaskIntoConstraints = false
        return chatContainer
    }()
    private var messageField: UITextField = {
        let textField = CommentTextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private var messageButton: UIButton = {
        let messageButton = UIButton()
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        messageButton.setImage(UIImage(named: "messageButtonIcon"), for: .normal)
        messageButton.layer.cornerRadius = 22
        messageButton.backgroundColor = UIColor(red: 0.694, green: 0.718, blue: 0.773, alpha: 1)
        return messageButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.95, green: 0.228, blue: 0.271, alpha: 1)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        view.backgroundColor = .white
        view.addSubview(scrollContainer)
        view.addSubview(footerContainer)
        
        scrollContainer.addSubview(scrollView)
        scrollView.addSubview(scrollContent)
        
        scrollContent.addSubview(postImage)
        scrollContent.addSubview(dateLabel)
        scrollContent.addSubview(titleLabel)
        scrollContent.addSubview(content)
        
        footerContainer.addSubview(reactionContainer)
        reactionContainer.addSubview(likeButton)
        reactionContainer.addSubview(likeCounter)
        reactionContainer.addSubview(chatButton)
        reactionContainer.addSubview(chatCounter)
        
        messageField.delegate = self
        messageButton.addTarget(self, action: #selector(changePrioroty), for: .touchUpInside)
        
        footerContainer.addSubview(messageContainer)
        messageContainer.addSubview(messageField)
        messageContainer.addSubview(messageButton)
        
        presenter?.updateData()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .plain, target: self, action: #selector(close))
    }
    
    @objc func close() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func changePrioroty() {
        dateLabel.text = "fjafdjadlfjalfks"
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            footerContainer.frame.origin.y -= (keyboardSize.height - (view.frame.size.height - (footerContainer.frame.origin.y + footerContainer.frame.size.height) ))
            
            scrollView.contentInset.bottom = keyboardSize.height - 20
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 1, delay: 0) {
            self.footerContainer.frame.origin.y = self.scrollContainer.frame.height
            //почему без анимации рабоает медленнее
        }
        scrollView.contentInset.bottom = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            scrollContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollContainer.topAnchor.constraint(equalTo: view.topAnchor),
            scrollContainer.bottomAnchor.constraint(equalTo: footerContainer.topAnchor),
            scrollContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]) ///scrollContainer
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: scrollContainer.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor),
        ]) ///scrollView
        NSLayoutConstraint.activate([
            scrollContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollContent.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            scrollContent.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
        ]) ///scrollContent
        NSLayoutConstraint.activate([
            footerContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            footerContainer.heightAnchor.constraint(equalToConstant: 110),
            footerContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footerContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ]) ///footerContainer
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: scrollContent.topAnchor),
            postImage.widthAnchor.constraint(equalTo: scrollContent.widthAnchor),
            postImage.heightAnchor.constraint(equalToConstant: 300),
            postImage.centerXAnchor.constraint(equalTo: scrollContent.centerXAnchor),
        ]) ///postImage
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -16),
            dateLabel.heightAnchor.constraint(equalToConstant: 18),
            dateLabel.centerXAnchor.constraint(equalTo: scrollContent.centerXAnchor),
        ]) ///dateLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -16),
            titleLabel.centerXAnchor.constraint(equalTo: scrollContent.centerXAnchor),
        ]) ///titleLabel
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            content.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 16),
            content.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -16),
            content.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor),
        ]) ///content
        NSLayoutConstraint.activate([
            reactionContainer.heightAnchor.constraint(equalToConstant: 30),
            reactionContainer.widthAnchor.constraint(equalToConstant: view.frame.size.width - 32),
            reactionContainer.topAnchor.constraint(equalTo: footerContainer.topAnchor, constant: 16),
            reactionContainer.centerXAnchor.constraint(equalTo: footerContainer.centerXAnchor)
        ]) ///reactionContainer
        NSLayoutConstraint.activate([
            likeButton.heightAnchor.constraint(equalToConstant: 24),
            likeButton.widthAnchor.constraint(equalToConstant: 24),
            likeButton.leadingAnchor.constraint(equalTo: reactionContainer.leadingAnchor),
            likeButton.centerYAnchor.constraint(equalTo: reactionContainer.centerYAnchor)
        ]) ///likeButton
        NSLayoutConstraint.activate([
            likeCounter.heightAnchor.constraint(equalToConstant: 24),
            likeCounter.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 7),
            likeCounter.centerYAnchor.constraint(equalTo: reactionContainer.centerYAnchor)
        ]) ///likeCounter
        NSLayoutConstraint.activate([
            chatButton.heightAnchor.constraint(equalToConstant: 24),
            chatButton.widthAnchor.constraint(equalToConstant: 24),
            chatButton.leadingAnchor.constraint(equalTo: likeCounter.trailingAnchor, constant: 30),
            chatButton.centerYAnchor.constraint(equalTo: reactionContainer.centerYAnchor)
        ]) ///chatButton
        NSLayoutConstraint.activate([
            chatCounter.heightAnchor.constraint(equalToConstant: 24),
            chatCounter.leadingAnchor.constraint(equalTo: chatButton.trailingAnchor, constant: 7),
            chatCounter.centerYAnchor.constraint(equalTo: reactionContainer.centerYAnchor)
        ]) ///chatCounter
        NSLayoutConstraint.activate([
            messageContainer.heightAnchor.constraint(equalToConstant: 44),
            messageContainer.widthAnchor.constraint(equalToConstant: view.frame.size.width - 32),
            messageContainer.bottomAnchor.constraint(equalTo: footerContainer.bottomAnchor, constant: -8),
            messageContainer.centerXAnchor.constraint(equalTo: footerContainer.centerXAnchor)
        ]) ///messageContainer
        NSLayoutConstraint.activate([
            messageField.heightAnchor.constraint(equalToConstant: 44),
            messageField.widthAnchor.constraint(equalToConstant: view.frame.size.width - 84),
            messageField.centerYAnchor.constraint(equalTo: messageContainer.centerYAnchor),
            messageField.leadingAnchor.constraint(equalTo: messageContainer.leadingAnchor)
        ]) ///messageField
        NSLayoutConstraint.activate([
            messageButton.heightAnchor.constraint(equalToConstant: 44),
            messageButton.widthAnchor.constraint(equalToConstant: 44),
            messageButton.centerYAnchor.constraint(equalTo: messageContainer.centerYAnchor),
            messageButton.trailingAnchor.constraint(equalTo: messageContainer.trailingAnchor)
        ]) ///messageButton
    }
    
}

extension DetailView: DetailViewProtocol {
    
    func onUpdate(_ data: Post?) {
        guard let data = data else { return }
        postImage.sd_setImage(with: URL(string: "\(data.media[0].original)"))
        dateLabel.text = data.publishedAt
        titleLabel.text = data.title
        content.text = data.description
    }
    
}

extension DetailView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if let text = textField.text {
            print(text)
        }
        textField.text = ""
        return true
    }
}
