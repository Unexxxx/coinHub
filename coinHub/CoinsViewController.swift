//
//  CoinsViewController.swift
//  coinHub
//
//  Created by Kent Onyx Arintok on 1/20/23.
//

import UIKit

class CoinsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var coins: [Coin] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ShowCoins")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCoins", for: indexPath)
        let coin = coins[indexPath.row]
        cell.textLabel?.text = coin.name
        return cell
    }
}
