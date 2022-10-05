//
//  EditView.swift
//  MenInDev_Test
//
//  Created by Eugene on 04.10.2022.
//

import UIKit

class EditView: UIViewController {
    
    lazy var scrollBottomConstraint = scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "default")
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.contentMode = .scaleAspectFill
        avatar.clipsToBounds = true
        avatar.layer.cornerRadius = 44
        return avatar
    }()
    
    let editButton: UIButton = {
        let edit = UIButton()
        edit.setTitle("Изменить фото", for: .normal)
        edit.setTitleColor(UIColor(red: 0.95, green: 0.228, blue: 0.271, alpha: 1), for: .normal)
        edit.translatesAutoresizingMaskIntoConstraints = false
        return edit
    }()

    let nameTextField: UITextField = {
        let name = CustomEditTextField(with: "Имя")
        name.placeholder = "Имя"
//        name.translatesAutoresizingMaskIntoConstraints = false
//        name.borderStyle = .none
        name.text = "Name"
        return name
    }()
    
    let secondNameTextField: UITextField = {
        let secondName = CustomEditTextField(with: "Фамилия")
        secondName.placeholder = "Фамилия"
//        secondName.translatesAutoresizingMaskIntoConstraints = false
//        secondName.borderStyle = .none
        secondName.text = "SecondName"
        return secondName
    }()
    
    let emailTextField: UITextField = {
        let email = CustomEditTextField(with: "E-mail")
        email.placeholder = "E-mail"
        
//        email.translatesAutoresizingMaskIntoConstraints = false
//        email.borderStyle = .none
        email.text = "E-mail"
        return email
    }()
    
    let phoneNumberTextField: UITextField = {
        let phoneNumber = CustomEditTextField(with: "Телефон")
        phoneNumber.placeholder = "+7 (000) 000 – 00 – 00"
//        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
//        phoneNumber.borderStyle = .none
        phoneNumber.text = "+7 (000) 000 – 00 – 00"
        return phoneNumber
    }()
    
    let deleteButton: UIButton = {
       let delete = UIButton()
        delete.translatesAutoresizingMaskIntoConstraints = false
        delete.setTitle("Удалить аккаунт", for: .normal)
        delete.setTitleColor(UIColor(red: 0.153, green: 0.153, blue: 0.161, alpha: 1), for: .normal)
        delete.titleLabel?.font = .systemFont(ofSize: 16)
        return delete
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
//        view.addSubview(avatar)
//        view.addSubview(editButton)
//        view.addSubview(nameTextField)
//        view.addSubview(secondNameTextField)
//        view.addSubview(emailTextField)
//        view.addSubview(phoneNumberTextField)
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(avatar)
        scrollView.addSubview(editButton)
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(secondNameTextField)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(phoneNumberTextField)
        scrollView.addSubview(deleteButton)
        
        nameTextField.delegate = self
        secondNameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(save))
    }
    
    @objc func save() {
        print("saved")
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollBottomConstraint.constant = -keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollBottomConstraint.constant = 0
    }
    
    func addBorderForName() {
        let nameBottomLine = CALayer()
        nameBottomLine.frame = CGRect(x: 0.0, y: nameTextField.frame.height - 1, width: nameTextField.frame.width, height: 1.0)
        nameBottomLine.backgroundColor = UIColor.gray.cgColor
        nameTextField.layer.addSublayer(nameBottomLine)
    }
    func addBorderForSecondName() {
        let secondNameBottomLine = CALayer()
        secondNameBottomLine.frame = CGRect(x: 0.0, y: secondNameTextField.frame.height - 1, width: secondNameTextField.frame.width, height: 1.0)
        secondNameBottomLine.backgroundColor = UIColor.gray.cgColor
        secondNameTextField.layer.addSublayer(secondNameBottomLine)
    }
    func addBorderForEmail() {
        let emailBottomLine = CALayer()
        emailBottomLine.frame = CGRect(x: 0.0, y: emailTextField.frame.height - 1, width: emailTextField.frame.width, height: 1.0)
        emailBottomLine.backgroundColor = UIColor.gray.cgColor
        emailTextField.layer.addSublayer(emailBottomLine)
        
    }
    func addBorderForPhone() {
        let phoneBottomLine = CALayer()
        phoneBottomLine.frame = CGRect(x: 0.0, y: phoneNumberTextField.frame.height - 1, width: phoneNumberTextField.frame.width, height: 1.0)
        phoneBottomLine.backgroundColor = UIColor.gray.cgColor
        phoneNumberTextField.layer.addSublayer(phoneBottomLine)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let navBar = navigationController?.navigationBar else { return }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            scrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollBottomConstraint
        ])
        
        NSLayoutConstraint.activate([
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.contentLayoutGuide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25),
            avatar.centerXAnchor.constraint(equalTo: scrollView.contentLayoutGuide.centerXAnchor),
            avatar.heightAnchor.constraint(equalToConstant: 88),
            avatar.widthAnchor.constraint(equalTo: avatar.heightAnchor)
        ])
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 20),
            editButton.centerXAnchor.constraint(equalTo: scrollView.contentLayoutGuide.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 36),
            nameTextField.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            secondNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 45),
            secondNameTextField.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            secondNameTextField.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 45),
            emailTextField.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            phoneNumberTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 45),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 67),
            deleteButton.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            deleteButton.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16),
            deleteButton.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
        
        
        addBorderForName()
        addBorderForEmail()
        addBorderForPhone()
        addBorderForSecondName()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }


}

extension EditView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
    }
}
