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
    
    func requestImage(imagem: String) -> UIImage {
        
        let url = ("https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_16/\(imagem).png")
        AF.request(url, method: .get, headers: nil).responseImage { (imagemRecebida) in
            if case .success(let image) = imagemRecebida.result {

                let imageFormated = image.af_imageRounded(withCornerRadius: 10)
                
                self.tableView.reloadData()
            }
        }
        
//        guard let imageUrl = URL(string: url) else {return UIImage()}
//        guard let imageData = NSData(contentsOf: imageUrl) else {return UIImage()}
//        guard let image = UIImage(data: imageData as Data) else {return UIImage()}
        return UIImage()
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
            let imagem = requestImage(imagem: dadosListaMoedas[indexPath.row].assetID)
            cell.configCell(dadosListaMoedas[indexPath.row], imagem: imagem)
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
