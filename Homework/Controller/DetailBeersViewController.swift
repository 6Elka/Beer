//
//  DetailBeersViewController.swift
//  Homework
//
//  Created by Artem on 20.02.2023.
//

import Foundation
import UIKit

//MARK: - DetailBeersViewController
final class DetailBeersViewController: UIViewController {
    
    //MARK: - Configure
    func configure(info: Beer) {
        self.name.text = info.name
        self.description_.text = info.description
        self.ingredients.text = "\(info.ingredients?.hops?.compactMap {$0.name}.joined(separator: "\n") ?? ""), \(info.ingredients?.malt?.compactMap {$0.name}.joined(separator: "\n") ?? ""), \(info.ingredients?.yeast ?? "")"
        self.foodPairing.text = "\(info.foodPairing?.joined(separator: "\n") ?? "")"
        
        //MARK: - ImageURL
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: info.imageURL!) else {return}
            guard let imageData = try? Data(contentsOf: imageUrl) else {return}
        
            DispatchQueue.main.async {
                self.image.image = UIImage(data: imageData)
            }
        }
    }
    
    //MARK: - Label
    private let name = UILabel().createLabel(size: 18, weight: .semibold, text: "")
    private let descriptionLabel = UILabel().createLabel(size: 17, weight: .semibold, text: "Description:")
    private let description_ = UILabel().createLabel(size: 15, weight: .regular, text: "")
    private let ingredientLabel = UILabel().createLabel(size: 17, weight: .semibold, text: "Ingerients:")
    private let ingredients = UILabel().createLabel(size: 15, weight: .regular, text: "")
    private let image = UIImageView().createImage()
    private let foodPairingLabel = UILabel().createLabel(size: 17, weight: .semibold, text: "FoodPairing")
    private let foodPairing = UILabel().createLabel(size: 15, weight: .regular, text: "")
    
    //MARK: - Beer
    private var beer = Beers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        title = "Kind of Beers"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        view.addSubview(name)
        view.addSubview(image)
        view.addSubview(descriptionLabel)
        view.addSubview(description_)
        view.addSubview(ingredientLabel)
        view.addSubview(ingredients)
        view.addSubview(foodPairingLabel)
        view.addSubview(foodPairing)
        
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            descriptionLabel.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            description_.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            description_.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            description_.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: 20),
            
            
            ingredientLabel.topAnchor.constraint(equalTo: description_.bottomAnchor, constant: 20),
            ingredientLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            ingredients.topAnchor.constraint(equalTo: ingredientLabel.bottomAnchor, constant: 5),
            ingredients.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            ingredients.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            foodPairingLabel.topAnchor.constraint(equalTo: ingredients.bottomAnchor, constant: 20),
            foodPairingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            foodPairing.topAnchor.constraint(equalTo: foodPairingLabel.bottomAnchor, constant: 5),
            foodPairing.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            foodPairing.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            image.centerYAnchor.constraint(equalTo: description_.centerYAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            image.heightAnchor.constraint(equalToConstant: 160),
            image.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
}
