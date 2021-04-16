//
//  ViewController.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 13/04/21.
//

import UIKit

class TelaPrincipalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dadosTeste: [MoedaInfoElement] = []
    
    @IBOutlet weak var listaMoedasTableView: UITableView!
    
    var api = MoedasAPI()
//      InfoMoedaAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.api.requestMoedas()
        self.listaMoedasTableView.delegate = self
        self.listaMoedasTableView.dataSource = self
        dadosTeste.append(MoedaInfoElement(assetID: "BTC", name: "cripto", typeIsCrypto: 1, dataStart: "2021", dataEnd: "2022", dataQuoteStart: "2000", dataQuoteEnd: "2001", dataOrderbookStart: "2010", dataOrderbookEnd: "2011", dataTradeStart: "1990", dataTradeEnd: "1991", dataSymbolsCount: 2, volume1HrsUsd: 12.0, volume1DayUsd: 10.0, volume1MthUsd: 15.0, priceUsd: 5.0, idIcon: "icon"))
        
        dadosTeste.append(MoedaInfoElement(assetID: "ETH", name: "cripto2", typeIsCrypto: 2, dataStart: "2021", dataEnd: "2022", dataQuoteStart: "2000", dataQuoteEnd: "2001", dataOrderbookStart: "2010", dataOrderbookEnd: "2011", dataTradeStart: "1990", dataTradeEnd: "1991", dataSymbolsCount: 2, volume1HrsUsd: 12.0, volume1DayUsd: 10.0, volume1MthUsd: 15.0, priceUsd: 10.0, idIcon: "icon"))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dadosTeste.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CelulaTableViewCell", for: indexPath) as? CelulaTableViewCell
        cell?.tag = indexPath.row
        let moeda = dadosTeste[indexPath.row]
        cell?.populaCelula(dados: moeda)
        
        return cell ?? CelulaTableViewCell()
    }
    
}
