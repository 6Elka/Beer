//
//  NetworkManager.swift
//  Homework
//
//  Created by Artem on 20.02.2023.
//

import Foundation
import UIKit

//MARK: - NetworkManager
final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    //MARK: - Beers method
    func downloadData(url: String, completion: @escaping (_ : Beers) -> (Void)) {
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {return}
            
            do {
                let beer = try JSONDecoder().decode(Beers.self, from: data)
                completion(beer)
            } catch {
                debugPrint(error.localizedDescription)
            }
                
        }.resume()
    }
}
