//
//  HomeTableTableViewController.swift
//  OnboardingMobileChallenge
//
//  Created by Jonattan Moises Sousa on 18/04/21.
//

import UIKit

class HomeTableTableViewController: UITableViewController {

    var dadosTeste: [ListaMoeda] = []
    var dadosListaMoedas: [ListaMoeda] = []
    var contador = 20
    var api = MoedasAPI()
    
    override func viewDidLoad() {
        self.tableView.backgroundColor = UIColor.corSecundaria ()
        super.viewDidLoad()
        let moedas = MoedasAPI()
        testePopulacao()
//        self.dadosListaMoedas = self.dadosTeste
        
        moedas.requestMoedas { (moedasRetornadas) in
            self.dadosListaMoedas = moedasRetornadas
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dadosListaMoedas.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell-moeda", for: indexPath) as? HomeUITableViewCell
        if let cell = cell {
            cell.configCell(dadosListaMoedas[indexPath.row])
            return cell
        } else {
            return HomeUITableViewCell()
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func testePopulacao() {
        dadosTeste.append(ListaMoeda(assetID: "BTC", name: "cripto", typeIsCrypto: 1, dataStart: "2021", dataEnd: "2022", dataQuoteStart: "2000", dataQuoteEnd: "2001", dataOrderbookStart: "2010", dataOrderbookEnd: "2011", dataTradeStart: "1990", dataTradeEnd: "1991", dataSymbolsCount: 2, volume1HrsUsd: 12.0, volume1DayUsd: 10.0, volume1MthUsd: 15.0, priceUsd: 5.0, idIcon: "icon"))
//         viewTopo.backgroundColor = UIColor.corSecundaria()
        
        dadosTeste.append(ListaMoeda(assetID: "ETH", name: "cripto2", typeIsCrypto: 2, dataStart: "2021", dataEnd: "2022", dataQuoteStart: "2000", dataQuoteEnd: "2001", dataOrderbookStart: "2010", dataOrderbookEnd: "2011", dataTradeStart: "1990", dataTradeEnd: "1991", dataSymbolsCount: 2, volume1HrsUsd: 12.0, volume1DayUsd: 10.0, volume1MthUsd: 15.0, priceUsd: 10.0, idIcon: "icon"))
        let carinhaTeste = ListaMoeda(assetID: "ETH", name: "cripto2", typeIsCrypto: 2, dataStart: "2021", dataEnd: "2022", dataQuoteStart: "2000", dataQuoteEnd: "2001", dataOrderbookStart: "2010", dataOrderbookEnd: "2011", dataTradeStart: "1990", dataTradeEnd: "1991", dataSymbolsCount: 2, volume1HrsUsd: 12.0, volume1DayUsd: 10.0, volume1MthUsd: 15.0, priceUsd: 10.0, idIcon: "icon")
        
        while self.contador > 1 {
            dadosTeste.append(carinhaTeste)
            self.contador = (self.contador - 1)
        }
    }

}
