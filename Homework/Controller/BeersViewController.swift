//
//  ViewController.swift
//  Homework
//
//  Created by Artem on 20.02.2023.
//

import UIKit

//MARK: - BeersViewController
final class BeersViewController: UIViewController {

    //MARK: - URL
    private let url = "https://api.punkapi.com/v2/beers?page=2&per_page=80"
    
    //MARK: - Table
    private let tableView = UITableView()
    
    //MARK: - Beers
    private var beer = Beers()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.frame = view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        setup()
        
        NetworkManager.shared.downloadData(url: url) { beer in
            self.beer = beer
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - Setup
    private func setup() {
        title = "List Beers"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.register(BeerTableCell.self, forCellReuseIdentifier: BeerTableCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: - Extension UITableViewDelegate / UITableViewDataSource
extension BeersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableCell.reuseId, for: indexPath) as! BeerTableCell
        cell.configure(info: beer[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailBeersViewController()
        detailViewController.configure(info: beer[indexPath.row])
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
 
