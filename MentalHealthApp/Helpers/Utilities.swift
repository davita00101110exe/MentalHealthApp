//
//  Utilities.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

class Utilities {
    
    static func customLabel(_ label: UILabel, _ fontSize: CGFloat, _ text: String) {
        label.font = UIFont.appRegularFontWith(size: fontSize)
        label.text = text
    }
    
    static func customTextField(_ textfield: UITextField, _ placeholder: String) {
        
        // Making textfields transparent and visible by only botttom line.
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = redColor.cgColor
        
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
        
        textfield.font = UIFont.appRegularFontWith(size: 18)
        textfield.placeholder = placeholder
        textfield.textAlignment = .center
        
        
        
    }
    
    static func customButton(_ button: UIButton, _ title: String) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.appRegularFontWith(size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = redColor
        button.layer.cornerRadius = 20
        button.tintColor = .clear
        
    }
    
    static func highlightedText(_ label: UILabel, _ text: String) {
        
        // Storing main text and word that will be colored in different color
        let mainString = label.text!
        let stringToColor = text
        
        let range = (mainString as NSString).range(of: stringToColor)
        
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        
        // Making the word in different color and bold font.
        mutableAttributedString.addAttribute(.foregroundColor, value: redColor, range: range)
        
        mutableAttributedString.addAttribute(.font, value: UIFont.appRegularBoldFontWith(size: label.font.pointSize), range: range)
        
        label.attributedText = mutableAttributedString
        
    }
    
    // Function for checking if password is secure.
    // Used from: https://medium.com/swlh/password-validation-in-swift-5-3de161569910
    static func isPasswordValid(_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
        
        return passwordTest.evaluate(with: password)
    }
    
    //TODO: function to validate email like done on passwords.
    
}