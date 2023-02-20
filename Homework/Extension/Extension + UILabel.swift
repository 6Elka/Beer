//
//  Extension + UILabel.swift
//  Homework
//
//  Created by Artem on 20.02.2023.
//

import Foundation
import UIKit

extension UILabel {
    func createLabel(size: CGFloat, weight: UIFont.Weight, text: String) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.text = text
        label.font = .systemFont(ofSize: size, weight: weight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
