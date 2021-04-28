//
//  DetalhesViewController.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 17/04/21.
//

import UIKit
import ModuloDetalhes
import CoreData

class DetalhesViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return (appDelegate?.persistentContainer.viewContext)!
    }
    var gerenciadorDeResultados: NSFetchedResultsController<MoedaEntity>?
    var sigla: String?
    let tela = CoinDetalheUIView.fromNib()
    
    @IBOutlet weak var stack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tela.idMoeda = sigla
        tela.seFavorito = verificaSeFavorito(self.sigla ?? "")
        self.tela.setupUI(self)
        stack.addArrangedSubview(tela)
    }
    func addFavorito(_ sigla: String) {
        let moeda = MoedaEntity(context: contexto)
        moeda.sigla = sigla
        atualizaBD()
    }
    func removeFavorito(_ idDeletar: String) {
        let favoritosBD = consultaBD()
        let localiza = favoritosBD.filter { $0.sigla == idDeletar}
        contexto.delete(localiza[0])
        atualizaBD()
    }
    public func consultaBD() -> [MoedaEntity] {
        let listaFavorito: NSFetchRequest<MoedaEntity> = MoedaEntity.fetchRequest()
        let ordena = NSSortDescriptor(key: "sigla", ascending: true)
        listaFavorito.sortDescriptors = [ordena]
        self.gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: listaFavorito, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        self.gerenciadorDeResultados?.delegate = self
        do {
            try gerenciadorDeResultados?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        guard let favoritosRecuperados = gerenciadorDeResultados?.fetchedObjects else { return [MoedaEntity]() }
        return favoritosRecuperados
    }
    public func verificaSeFavorito(_ id: String) -> Bool {
        let favoritos = resgateFavoritos()
        let existeEmFavoritos = favoritos.filter { $0 == id }
        if existeEmFavoritos.count > 0 {
            return true
        }
        return false
    }
    func resgateFavoritos() -> [String] {
        var listaExtraida: [String] = []
        let favoritosBD = consultaBD()
        for moeda in favoritosBD {
            guard let id = moeda.sigla else { return listaExtraida }
            listaExtraida.append(id)
        }
        return listaExtraida
    }
    func atualizaBD() {
        do {
            try contexto.save()
            print("Sucesso na operação")
        } catch {
            print(error.localizedDescription)
        }
    }
    // Não utilizada no momento
    func removeTodosOsFavoritos() {
//        let moedas = consultaBD()
//        for moeda in moedas {
//            contexto.delete(moeda)
//        }
        atualizaBD()
    }
}
extension DetalhesViewController: CoinDetalheDelegate {
    func voltar() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func favoritar(_ id: String, _ acao: Bool) {
        if !acao {
            addFavorito(id)
        } else {
            removeFavorito(id)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
