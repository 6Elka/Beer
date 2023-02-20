//
//  Extension + UIImageView.swift
//  Homework
//
//  Created by Artem on 20.02.2023.
//

import Foundation
import UIKit

extension UIImageView {
    func createImage() -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
}
