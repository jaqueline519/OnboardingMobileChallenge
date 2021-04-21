//
//  HomeTableTableViewController.swift
//  OnboardingMobileChallenge
//
//  Created by Jonattan Moises Sousa on 18/04/21.
//

import UIKit
import Alamofire
import AlamofireImage
import ModuloCommons

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
    
    public func requestImages(imagem: String) -> URL? {
        let nameImage = imagem.replacingOccurrences(of: "-", with: "", options: .regularExpression)
        let url = ("https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_64/\(nameImage).png")
        guard let urlTratada = URL(string: url) else { return nil }
        return urlTratada
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
            let moeda = dadosListaMoedas[indexPath.row]
            guard let stringImagem = moeda.idIcon else { return cell }
            guard let imagem = requestImages(imagem: stringImagem) else { return cell }
            cell.configCell(moeda, imagem)
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
