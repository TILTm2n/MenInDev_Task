//
//  ProfileView.swift
//  MenInDev_Test
//
//  Created by Eugene on 19.09.2022.
//

import UIKit

protocol ProfileViewProtocol {
    func success()
    func failure(error: Error)
}

class ProfileView: UIViewController {

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
        return icon
    }()
    
    let firstName: UILabel = {
        let name = UILabel()
        name.text = "Владимир"
        name.font = .systemFont(ofSize: 15)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let secondName: UILabel = {
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
        view.addSubview(secondName)
        
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
        imageView.image = UIImage(named: "yt")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        print(imageView.frame)
        return imageView
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        let fbv = FeedBackView()
        navigationController?.pushViewController(fbv, animated: true)
    }
    
    @objc func editView() {
        let edv = EditView()
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
        ])
        NSLayoutConstraint.activate([
            userIcon.leadingAnchor.constraint(equalTo: userContainer.leadingAnchor, constant: 16),
            userIcon.topAnchor.constraint(equalTo: userContainer.topAnchor, constant: 16),
            userIcon.bottomAnchor.constraint(equalTo: userContainer.bottomAnchor, constant: -16),
            userIcon.centerYAnchor.constraint(equalTo: userContainer.centerYAnchor),
            userIcon.heightAnchor.constraint(equalToConstant: 40),
            userIcon.widthAnchor.constraint(equalTo: userIcon.heightAnchor)
        ])
        NSLayoutConstraint.activate([
            firstName.topAnchor.constraint(equalTo: userContainer.topAnchor, constant: 16),
            firstName.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 16),
            firstName.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -16),
        ])
        NSLayoutConstraint.activate([
            secondName.bottomAnchor.constraint(equalTo: userContainer.bottomAnchor, constant: -16),
            secondName.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 16),
            secondName.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -16),
            secondName.topAnchor.constraint(equalTo: firstName.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            editButton.trailingAnchor.constraint(equalTo: userContainer.trailingAnchor, constant: -16),
            editButton.topAnchor.constraint(equalTo: userContainer.topAnchor, constant: 25),
            editButton.bottomAnchor.constraint(equalTo: userContainer.bottomAnchor, constant: -25),
            editButton.centerYAnchor.constraint(equalTo: userContainer.centerYAnchor),
            editButton.heightAnchor.constraint(equalToConstant: 22),
            editButton.widthAnchor.constraint(equalTo: editButton.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            helpContainer.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            helpContainer.topAnchor.constraint(equalTo: userContainer.bottomAnchor, constant: 8),
            helpContainer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            helpIcon.leadingAnchor.constraint(equalTo: helpContainer.leadingAnchor, constant: 16),
            helpIcon.topAnchor.constraint(equalTo: helpContainer.topAnchor, constant: 25),
            helpIcon.bottomAnchor.constraint(equalTo: helpContainer.bottomAnchor, constant: -25),
            helpIcon.centerYAnchor.constraint(equalTo: helpContainer.centerYAnchor),
            helpIcon.heightAnchor.constraint(equalToConstant: 22),
            helpIcon.widthAnchor.constraint(equalTo: helpIcon.heightAnchor)
        ])
        NSLayoutConstraint.activate([
            helpLabel.leadingAnchor.constraint(equalTo: helpIcon.trailingAnchor, constant: 16),
            helpLabel.trailingAnchor.constraint(equalTo: helpArrow.leadingAnchor, constant: -16),
            helpLabel.centerYAnchor.constraint(equalTo: helpContainer.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            helpArrow.trailingAnchor.constraint(equalTo: helpContainer.trailingAnchor, constant: -16),
            helpArrow.topAnchor.constraint(equalTo: helpContainer.topAnchor, constant: 25),
            helpArrow.bottomAnchor.constraint(equalTo: helpContainer.bottomAnchor, constant: -25),
            helpArrow.centerYAnchor.constraint(equalTo: helpContainer.centerYAnchor),
            helpArrow.heightAnchor.constraint(equalToConstant: 22),
            helpArrow.widthAnchor.constraint(equalToConstant: 12)
        ])
        
        NSLayoutConstraint.activate([
            outButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            outButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            outButton.topAnchor.constraint(equalTo: helpContainer.bottomAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            socialNetworkContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            socialNetworkContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            socialNetworkContainer.topAnchor.constraint(equalTo: outButton.bottomAnchor, constant: 55),
            socialNetworkContainer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            socialNetworkContainer.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            socialStackView.leadingAnchor.constraint(equalTo: socialNetworkContainer.leadingAnchor, constant: 40),
            socialStackView.trailingAnchor.constraint(equalTo: socialNetworkContainer.trailingAnchor, constant: -40),
            socialStackView.topAnchor.constraint(equalTo: socialNetworkContainer.topAnchor),
            socialStackView.bottomAnchor.constraint(equalTo: socialNetworkContainer.bottomAnchor),
        ])
        
    }
    

}

extension ProfileView: ProfileViewProtocol {
    func success() {
        
    }
    
    func failure(error: Error) {
        
    }
}

