//
//  CommentTextField.swift
//  MenInDev_Test
//
//  Created by Eugene on 25.09.2022.
//

import Foundation
import UIKit

class CommentTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.cornerRadius = 22
        self.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.91, alpha: 1).cgColor
        self.layer.borderWidth = 1
        //self.backgroundColor = .secondarySystemBackground
        self.textColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var textPadding = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

}
