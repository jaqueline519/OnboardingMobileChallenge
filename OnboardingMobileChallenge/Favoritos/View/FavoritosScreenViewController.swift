//
//  FavoritosScreenViewController.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 18/04/21.
//

import UIKit
import CoreData
import Favoritos

class FavoritosScreenViewController: UIViewController {
    
    @IBOutlet weak var stackFavoritos: UIStackView!
    var gerenciaResultado: NSFetchedResultsController<MoedaEntity>?
    var favoritos: FavoritosViewController?
    var contexto: NSManagedObjectContext{
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return (appDelegate?.persistentContainer.viewContext)!
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.recuperaMoeda()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showDetailsAction()
        
    }
    func recuperaMoeda() {
        let buscaMoedaSalva: NSFetchRequest<MoedaEntity> = MoedaEntity.fetchRequest()
        let ordenaPorSigla = NSSortDescriptor(key: "sigla", ascending: true)
        buscaMoedaSalva.sortDescriptors = [ordenaPorSigla]
        gerenciaResultado = NSFetchedResultsController(fetchRequest: buscaMoedaSalva, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        do {
        try gerenciaResultado?.performFetch()
            print(Locale.self)
        } catch {
            print(error.localizedDescription)
        }

//       favoritos.self?.recebeMoedas(array: gerenciaResultado?.fetchRequest ?? [])
        
    }
    
        func showDetailsAction() {
            let viewC = FavoritosViewController.fromSB()
            self.present(viewC, animated: true, completion: nil)
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }

}

