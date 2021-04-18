//
//  HomeTableTableViewController.swift
//  OnboardingMobileChallenge
//
//  Created by Jonattan Moises Sousa on 18/04/21.
//

import UIKit

class HomeTableTableViewController: UITableViewController {

    var dadosListaMoedas: [ListaMoeda] = []
    var api = MoedasAPI()
    
    override func viewDidLoad() {
        self.tableView.backgroundColor = UIColor.corSecundaria ()
        super.viewDidLoad()
        let moedas = MoedasAPI()
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let moedaSelecionada = dadosListaMoedas[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        DetalhesViewController().sigla = moedaSelecionada.assetID
        let controller = storyboard.instantiateViewController(identifier: "DetalhesMoeda") as DetalhesViewController
        controller.sigla = moedaSelecionada.assetID
//        controller.sigla = moedaSelecionada.assetID
        present(controller, animated: true, completion: nil)
    }
}
