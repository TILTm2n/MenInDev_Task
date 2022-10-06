//
//  ProfileView.swift
//  MenInDev_Test
//
//  Created by Eugene on 19.09.2022.
//

import UIKit
import SDWebImage

enum SocialNetworks: String {
    case yandex = "ya"
    case vkontakte = "vk"
    case telegram = "tg"
    case youtube = "yt"
    case tiktok = "tt"
}

protocol ProfileViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

class ProfileView: UIViewController {
    
    var presenter: ProfilePresenterProtocol?

    let userContainer: UIView = {
        let user = UIView()
        user.backgroundColor = .white
        user.translatesAutoresizingMaskIntoConstraints = false
        return user
    }()
    let userIcon: UIImageView = {
        let icon = UIImageView()
        icon.backgroundColor = .blue
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        return icon
    }()
    let firstName: UILabel = {
        let name = UILabel()
        name.text = "Владимир"
        name.font = .systemFont(ofSize: 15)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    let lastName: UILabel = {
        let name = UILabel()
        name.text = "Якуба"
        name.font = .systemFont(ofSize: 15)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    let editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "editButton"), for: .normal)
        button.addTarget(self, action: #selector(editView), for: .touchUpInside)
        return button
    }()
    let helpContainer: UIView = {
        let help = UIView()
        help.backgroundColor = .white
        help.translatesAutoresizingMaskIntoConstraints = false
        return help
    }()
    let helpIcon: UIImageView = {
        let help = UIImageView()
        help.translatesAutoresizingMaskIntoConstraints = false
        help.image = UIImage(named: "help")
        return help
    }()
    let helpLabel: UILabel = {
        let name = UILabel()
        name.text = "Обратная связь"
        name.font = .systemFont(ofSize: 17)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    let helpArrow: UIImageView = {
        let help = UIImageView()
        help.image = UIImage(named: "helpArrow")
        help.translatesAutoresizingMaskIntoConstraints = false
        return help
    }()
    let outButton: UIButton = {
        let outButton = UIButton()
        outButton.setTitle("Выйти из профиля", for: .normal)
        outButton.titleLabel?.font = .systemFont(ofSize: 20)
        outButton.setTitleColor(UIColor.black, for: .normal)
        outButton.translatesAutoresizingMaskIntoConstraints = false
        return outButton
    }()
    let socialNetworkContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    let socialStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1)
        
        view.addSubview(userContainer)
        view.addSubview(userIcon)
        view.addSubview(editButton)
        view.addSubview(firstName)
        view.addSubview(lastName)
        view.addSubview(helpContainer)
        view.addSubview(helpIcon)
        view.addSubview(helpLabel)
        view.addSubview(helpArrow)
        view.addSubview(outButton)
        view.addSubview(socialNetworkContainer)
        view.addSubview(socialStackView)
        
        UIApplication.shared.setStatusBarColor(with: .white)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        helpContainer.addGestureRecognizer(tap)
        
        for _ in 0...4 {
            socialStackView.addArrangedSubview(createBlock())
        }
        
    }
    
    func createBlock() -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.image = UIImage(named: "tg")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        let fbv = FeedBackView()
        navigationController?.pushViewController(fbv, animated: true)
    }
    
    @objc func editView() {
        let edv = Builder.buildEditModule()
        navigationController?.pushViewController(edv, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate([
            userContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userContainer.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            userContainer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ]) ///userContainer
        NSLayoutConstraint.activate([
            userIcon.leadingAnchor.constraint(equalTo: userContainer.leadingAnchor, constant: 16),
            userIcon.topAnchor.constraint(equalTo: userContainer.topAnchor, constant: 16),
            userIcon.bottomAnchor.constraint(equalTo: userContainer.bottomAnchor, constant: -16),
            userIcon.centerYAnchor.constraint(equalTo: userContainer.centerYAnchor),
            userIcon.heightAnchor.constraint(equalToConstant: 40),
            userIcon.widthAnchor.constraint(equalTo: userIcon.heightAnchor)
        ]) ///userIcon
        NSLayoutConstraint.activate([
            firstName.topAnchor.constraint(equalTo: userContainer.topAnchor, constant: 16),
            firstName.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 16),
            firstName.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -16),
        ]) ///firstName
        NSLayoutConstraint.activate([
            lastName.bottomAnchor.constraint(equalTo: userContainer.bottomAnchor, constant: -16),
            lastName.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 16),
            lastName.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -16),
            lastName.topAnchor.constraint(equalTo: firstName.bottomAnchor)
        ]) ///lastName
        NSLayoutConstraint.activate([
            editButton.trailingAnchor.constraint(equalTo: userContainer.trailingAnchor, constant: -16),
            editButton.topAnchor.constraint(equalTo: userContainer.topAnchor, constant: 25),
            editButton.bottomAnchor.constraint(equalTo: userContainer.bottomAnchor, constant: -25),
            editButton.centerYAnchor.constraint(equalTo: userContainer.centerYAnchor),
            editButton.heightAnchor.constraint(equalToConstant: 22),
            editButton.widthAnchor.constraint(equalTo: editButton.heightAnchor)
        ]) ///editButton
        NSLayoutConstraint.activate([
            helpContainer.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            helpContainer.topAnchor.constraint(equalTo: userContainer.bottomAnchor, constant: 8),
            helpContainer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ]) ///helpContainer
        NSLayoutConstraint.activate([
            helpIcon.leadingAnchor.constraint(equalTo: helpContainer.leadingAnchor, constant: 16),
            helpIcon.topAnchor.constraint(equalTo: helpContainer.topAnchor, constant: 25),
            helpIcon.bottomAnchor.constraint(equalTo: helpContainer.bottomAnchor, constant: -25),
            helpIcon.centerYAnchor.constraint(equalTo: helpContainer.centerYAnchor),
            helpIcon.heightAnchor.constraint(equalToConstant: 22),
            helpIcon.widthAnchor.constraint(equalTo: helpIcon.heightAnchor)
        ]) ///helpIcon
        NSLayoutConstraint.activate([
            helpLabel.leadingAnchor.constraint(equalTo: helpIcon.trailingAnchor, constant: 16),
            helpLabel.trailingAnchor.constraint(equalTo: helpArrow.leadingAnchor, constant: -16),
            helpLabel.centerYAnchor.constraint(equalTo: helpContainer.centerYAnchor)
        ]) ///helpLabel
        NSLayoutConstraint.activate([
            helpArrow.trailingAnchor.constraint(equalTo: helpContainer.trailingAnchor, constant: -16),
            helpArrow.topAnchor.constraint(equalTo: helpContainer.topAnchor, constant: 25),
            helpArrow.bottomAnchor.constraint(equalTo: helpContainer.bottomAnchor, constant: -25),
            helpArrow.centerYAnchor.constraint(equalTo: helpContainer.centerYAnchor),
            helpArrow.heightAnchor.constraint(equalToConstant: 22),
            helpArrow.widthAnchor.constraint(equalToConstant: 12)
        ]) ///helpArrow
        NSLayoutConstraint.activate([
            outButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            outButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            outButton.topAnchor.constraint(equalTo: helpContainer.bottomAnchor, constant: 40)
        ]) ///outButton
        NSLayoutConstraint.activate([
            socialNetworkContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            socialNetworkContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            socialNetworkContainer.topAnchor.constraint(equalTo: outButton.bottomAnchor, constant: 55),
            socialNetworkContainer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            socialNetworkContainer.heightAnchor.constraint(equalToConstant: 40)
        ]) ///socialNetworkContainer
        NSLayoutConstraint.activate([
            socialStackView.leadingAnchor.constraint(equalTo: socialNetworkContainer.leadingAnchor, constant: 40),
            socialStackView.trailingAnchor.constraint(equalTo: socialNetworkContainer.trailingAnchor, constant: -40),
            socialStackView.topAnchor.constraint(equalTo: socialNetworkContainer.topAnchor),
            socialStackView.bottomAnchor.constraint(equalTo: socialNetworkContainer.bottomAnchor),
        ]) ///socialStackView
        
        userIcon.layer.cornerRadius = userIcon.frame.size.height/2
    }
    
    func setupUI(_ info: UserInfo) {
        userIcon.sd_setImage(with: URL(string: info.user.avatar.original), placeholderImage: UIImage(named: "default"))
        firstName.text = info.user.firstName
        lastName.text = info.user.lastName
    }
    
}

extension ProfileView: ProfileViewProtocol {
    func success() {
        guard let info = presenter?.userData else { return }
        setupUI(info)
        print("view success")
    }
    
    func failure(error: Error) {
        let alert = UIAlertController(title: "Unable to get data", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
}

