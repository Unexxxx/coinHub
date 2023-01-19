//
//  ViewController.swift
//  coinHub
//
//  Created by Kent Onyx Arintok on 1/19/23.
//

import UIKit
import Moya


class ViewController: UIViewController {
    
    let provider = MoyaProvider<CoinGeckoService>()
    
    @IBOutlet weak var touchMe: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        touchMe.addTarget(self, action: #selector(getCoinList), for: .touchUpInside)
        view.addSubview(touchMe)

    }
    
    @objc func getCoinList() {
        provider.request(.coinsList) { result in
            switch result {
            case .success(let response):
                do {
                    let coinData = try JSONDecoder().decode([Coin].self, from: response.data)
                    let coins = Array(coinData)
                    self.performSegue(withIdentifier: "ShowCoins", sender: coins)
                } catch let error {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCoins" {
            let destinationVC = storyboard?.instantiateViewController(withIdentifier: "coinsViewController") as! CoinsViewController
            destinationVC.modalPresentationStyle = .fullScreen
            present(destinationVC, animated: true, completion: nil)
            destinationVC.coins = sender as! [Coin]
        }
    }
}

