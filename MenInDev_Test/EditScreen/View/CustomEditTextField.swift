//
//  CustomEditTextField.swift
//  MenInDev_Test
//
//  Created by Eugene on 05.10.2022.
//

import UIKit

class CustomEditTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(with label: String) {
        self.init(frame: .zero)
        setupTextField(label)
        borderStyle = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupTextField(_ text: String) {
        let label = UILabel()
        label.text = text
        label.textColor = UIColor(red: 0.6, green: 0.62, blue: 0.663, alpha: 1)
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.bottomAnchor.constraint(equalTo: topAnchor, constant: -8).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
    }

}
