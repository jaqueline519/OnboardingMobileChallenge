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
        self.listaMoedasTableView.delegate = self
        self.listaMoedasTableView.dataSource = self
    }
    
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
