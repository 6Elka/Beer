//
//  BeerTableCell.swift
//  Homework
//
//  Created by Artem on 20.02.2023.
//

import Foundation
import UIKit

//MARK: - BeerTableCell
final class BeerTableCell: UITableViewCell {
    
    func configure(info: Beer) {
        name.text = info.name
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: info.imageURL!) else {return}
            guard let imageData = try? Data(contentsOf: imageUrl) else {return}
        
            DispatchQueue.main.async {
                self.image.image = UIImage(data: imageData)
            }
        }
    }
    
    static let reuseId = "Cell"
    
    private let name = UILabel().createLabel(size: 15, weight: .medium, text: "")
    private let image = UIImageView().createImage()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .white
        addSubview(name)
        addSubview(image)
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            name.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            image.widthAnchor.constraint(equalToConstant: 50) 
        ])
    }
}
