//
//  FeedBackScreen.swift
//  MenInDev_Test
//
//  Created by Eugene on 04.10.2022.
//

import UIKit

protocol FeedbackViewProtocol {
    
}

class FeedBackView: UIViewController {
    
    var data: [String] = []

    var textPadding = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
    
    let descriptionLabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 0
        description.lineBreakMode = .byWordWrapping
        description.textColor = .black
        description.text = "Подробно опишите Вашу проблему \nили вопрос, мы ответим как можно быстрее"
        description.font = .systemFont(ofSize: 16, weight: .light)
        
        return description
    }()
    
    let nameTextField: UITextField = {
        let name = UITextField()
        name.placeholder = "Как Вас зовут?"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.borderStyle = .none
        return name
    }()
    
    let emailTextField: UITextField = {
        let email = UITextField()
        email.placeholder = "Почта для ответа"
        email.translatesAutoresizingMaskIntoConstraints = false
        email.borderStyle = .none
        return email
    }()
    
    let questionTextField: UITextField = {
        let question = UITextField()
        question.placeholder = "Ваше обращение"
        question.translatesAutoresizingMaskIntoConstraints = false
        question.borderStyle = .none
        
        return question
    }()
    
    let sendButton: UIButton = {
        let send = UIButton()
        send.translatesAutoresizingMaskIntoConstraints = false
        send.setTitle("Отправить", for: .normal)
        send.backgroundColor = UIColor(red: 0.894, green: 0.91, blue: 0.933, alpha: 1)
        send.layer.cornerRadius = 12
        return send
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(descriptionLabel)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(questionTextField)
        view.addSubview(sendButton)
        
        navigationItem.title = "Обратная связь"
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        questionTextField.delegate = self
        
        sendButton.isEnabled = false
        [nameTextField, emailTextField, questionTextField].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let name = nameTextField.text, !name.isEmpty,
            let email = emailTextField.text, !email.isEmpty,
            let question = questionTextField.text, !question.isEmpty
        else {
            sendButton.backgroundColor = UIColor(red: 0.894, green: 0.91, blue: 0.933, alpha: 1)
            sendButton.isEnabled = false
            return
        }
        sendButton.backgroundColor = UIColor(red: 0.95, green: 0.228, blue: 0.271, alpha: 1)
        sendButton.isEnabled = true
    }
    
    func addBorderForName() {
        let nameBottomLine = CALayer()
        nameBottomLine.frame = CGRect(x: 0.0, y: nameTextField.frame.height - 1, width: nameTextField.frame.width, height: 1.0)
        nameBottomLine.backgroundColor = UIColor.gray.cgColor
        nameTextField.layer.addSublayer(nameBottomLine)
    }
    func addBorderForEmail() {
        let emailBottomLine = CALayer()
        emailBottomLine.frame = CGRect(x: 0.0, y: emailTextField.frame.height - 1, width: emailTextField.frame.width, height: 1.0)
        emailBottomLine.backgroundColor = UIColor.gray.cgColor
        emailTextField.layer.addSublayer(emailBottomLine)
        
    }
    func addBorderForQuestion() {
        let questionBottomLine = CALayer()
        questionBottomLine.frame = CGRect(x: 0.0, y: questionTextField.frame.height - 1, width: questionTextField.frame.width, height: 1.0)
        questionBottomLine.backgroundColor = UIColor.gray.cgColor
        questionTextField.layer.addSublayer(questionBottomLine)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let navBar = navigationController?.navigationBar else { return }
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 56),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 56),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            questionTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 56),
            questionTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            questionTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: questionTextField.bottomAnchor, constant: 44),
            sendButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            sendButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            sendButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    override func viewWillLayoutSubviews() {
        addBorderForName()
        addBorderForEmail()
        addBorderForQuestion()
    }
    

}

extension FeedBackView: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField.text?.count == 1 {
//            if textField.text?.first == " " {
//                textField.text = ""
//                return
//            }
//        }
//        guard
//            let name = nameTextField.text, !name.isEmpty,
//            let email = emailTextField.text, !email.isEmpty,
//            let question = questionTextField.text, !question.isEmpty
//        else {
//            sendButton.isEnabled = false
//            return
//        }
//        sendButton.backgroundColor = UIColor(red: 0.95, green: 0.228, blue: 0.271, alpha: 1)
//        sendButton.isEnabled = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
