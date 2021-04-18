//
//  DetalhesViewController.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 17/04/21.
//

import UIKit
import ModuloDetalhes

class DetalhesViewController: UIViewController {
    @IBOutlet weak var stack: UIStackView!
    
    let tela = CoinDetalheUIView.fromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tela.setupUI(self, "BTC")
        stack.addArrangedSubview(tela)
    }
}
extension DetalhesViewController: CoinDetalheDelegate {
    func favoritar(_ id: String) {
        //Criar ação
    }
    
    
}
