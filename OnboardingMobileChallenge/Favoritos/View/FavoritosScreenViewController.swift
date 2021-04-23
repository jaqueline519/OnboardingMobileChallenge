//
//  FavoritosScreenViewController.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 18/04/21.
//

import UIKit
import CoreData
import Favoritos
import ModuloCommons

class FavoritosScreenViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var stackFavoritos: UIStackView!
    var gerenciaResultado: NSFetchedResultsController<MoedaEntity>?
    var favoritos: FavoritosViewController?
    var moedasFavoritadas = ["BTC", "ETH", "PLN", "AUD"]
    var listaMoedasFavoritadas: [String] = []
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return (appDelegate?.persistentContainer.viewContext)!
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.recuperaFavoritos()
        showDetailsAction()
       // self.recuperaMoeda() // Já está dentro do módulo a requisição
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        favoritos?.moedasFavoritadas = listaMoedasFavoritadas
//        if let tela = favoritos {
//            tela.setupUI(self.listaMoedasFavoritadas)
//        }
//        favoritos?.setupUI(listaMoedasFavoritadas)
        
    }
    
    
    // RECUPERANDO FAVORITOS
    func recuperaFavoritos() {
        let listaFavorito: NSFetchRequest<MoedaEntity> = MoedaEntity.fetchRequest()
        let ordena = NSSortDescriptor(key: "sigla", ascending: true)
        listaFavorito.sortDescriptors = [ordena]
        gerenciaResultado = NSFetchedResultsController(fetchRequest: listaFavorito, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        gerenciaResultado?.delegate = self
        do {
            try gerenciaResultado?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        guard let favoritosRecuperados = gerenciaResultado?.fetchedObjects else { return }
        for moeda in favoritosRecuperados {
            guard let id = moeda.sigla else { return }
            listaMoedasFavoritadas.append(id)
        }
        // return favoritosRecuperados // Essa função não possui retorno
    }
    
        func showDetailsAction() {
            let viewC = FavoritosViewController.fromSB(self.moedasFavoritadas)
            self.present(viewC, animated: true, completion: nil)
            favoritos?.setupUI(self.listaMoedasFavoritadas)
            
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }

}
