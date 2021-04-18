//
//  ViewController.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 13/04/21.
//

import UIKit
import ModuloCommons

class TelaPrincipalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dadosTeste: [MoedaInfoElement] = []
    var contador = 20
    
    @IBOutlet weak var listaMoedasTableView: UITableView!
    
    @IBOutlet weak var viewTopo: UIView!
    var api = MoedasAPI()
//      InfoMoedaAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.api.requestMoedas()
        self.listaMoedasTableView.delegate = self
        self.listaMoedasTableView.dataSource = self
        dadosTeste.append(MoedaInfoElement(assetID: "BTC", name: "cripto", typeIsCrypto: 1, dataStart: "2021", dataEnd: "2022", dataQuoteStart: "2000", dataQuoteEnd: "2001", dataOrderbookStart: "2010", dataOrderbookEnd: "2011", dataTradeStart: "1990", dataTradeEnd: "1991", dataSymbolsCount: 2, volume1HrsUsd: 12.0, volume1DayUsd: 10.0, volume1MthUsd: 15.0, priceUsd: 5.0, idIcon: "icon"))
//         viewTopo.backgroundColor = UIColor.corSecundaria()
        
        dadosTeste.append(MoedaInfoElement(assetID: "ETH", name: "cripto2", typeIsCrypto: 2, dataStart: "2021", dataEnd: "2022", dataQuoteStart: "2000", dataQuoteEnd: "2001", dataOrderbookStart: "2010", dataOrderbookEnd: "2011", dataTradeStart: "1990", dataTradeEnd: "1991", dataSymbolsCount: 2, volume1HrsUsd: 12.0, volume1DayUsd: 10.0, volume1MthUsd: 15.0, priceUsd: 10.0, idIcon: "icon"))
        let carinhaTeste = MoedaInfoElement(assetID: "ETH", name: "cripto2", typeIsCrypto: 2, dataStart: "2021", dataEnd: "2022", dataQuoteStart: "2000", dataQuoteEnd: "2001", dataOrderbookStart: "2010", dataOrderbookEnd: "2011", dataTradeStart: "1990", dataTradeEnd: "1991", dataSymbolsCount: 2, volume1HrsUsd: 12.0, volume1DayUsd: 10.0, volume1MthUsd: 15.0, priceUsd: 10.0, idIcon: "icon")
        
        while self.contador > 1 {
            dadosTeste.append(carinhaTeste)
            self.contador = (self.contador - 1)
        }
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 85
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CelulaTableViewCell", for: indexPath) as? CelulaTableViewCell
        guard let celula = cell else { return CelulaTableViewCell() }
            celula.tag = indexPath.row
            let moeda = dadosTeste[indexPath.row]
            celula.populaCelula(moeda)
        self.listaMoedasTableView.reloadData()
            return celula
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
//    }
    
    
    
    
}
