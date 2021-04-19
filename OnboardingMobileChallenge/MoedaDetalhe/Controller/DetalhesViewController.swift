//
//  DetalhesViewController.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 17/04/21.
//

import UIKit
import ModuloDetalhes
import CoreData

class DetalhesViewController: UIViewController {
    
    var contexto: NSManagedObjectContext{

        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return (appDelegate?.persistentContainer.viewContext)!
    }
    
    @IBOutlet weak var stack: UIStackView!
    var sigla: String?
    let tela = CoinDetalheUIView.fromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let siglaMoeda = sigla {
            self.tela.setupUI(self, siglaMoeda)
        }
        stack.addArrangedSubview(tela)
    }
    
}
extension DetalhesViewController: CoinDetalheDelegate {
    func favoritar(_ id: String) {
        let moeda = MoedaEntity(context: contexto)
        moeda.sigla = sigla
        
        do {
        try contexto.save()
            print("--Salvou")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}
