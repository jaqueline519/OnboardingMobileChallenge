//
//  FavoritosViewController.swift
//  Favoritos
//
//  Created by Jaqueline Bittencourt Santos on 17/04/21.
//

import UIKit
import ModuloCommons

public protocol FavoriteDelegate: class {
    func voltar()
}

public class FavoritosViewController: UIViewController, UICollectionViewDataSource {
    
    
    var moedaInfo: [MoedaInfoElement] = []
//    var viewTop: ViewTop?
    public var moedasFavoritadas = ["BTC","ETH","PLN","AUD"]
    var voltarDelegate: FavoriteDelegate?
    var acaoVoltar: (() -> Void)?
    
    @IBOutlet weak var stackTop: UIStackView!
    @IBOutlet weak var colecaoFavoritos: UICollectionView!
    
    @IBOutlet weak var stackFavoritos: UIStackView!
//    var favoritoDelegate: FavoritosDelegate?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        colecaoFavoritos.delegate = self
        colecaoFavoritos.dataSource = self
        self.configuraView(titulo: "Moeda Digital", y: 160, cor: .corTexto())
    }
    
    public func setupUI(_ delegate: FavoriteDelegate) {
        self.voltarDelegate = delegate
    }
    
    public override func viewWillAppear(_ animated: Bool) {
//        setupUI()
    }
    func configuraView(titulo: String, y: Int, cor: UIColor) {
        self.view.backgroundColor = UIColor.corSecundaria()
        let tituloLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        tituloLabel.text = String()
        tituloLabel.textAlignment = .center
        tituloLabel.backgroundColor = .corTexto()
//       stackTop.addArrangedSubview(tituloLabel)
        
        let myView = ViewTop().loadNib()
        myView.backgroundColor = .corSecundaria()
        stackTop.addArrangedSubview(myView)
        let viewQualquer = UIView()
        stackTop.addArrangedSubview(viewQualquer)
    }
    
    public func setupUI(_ listaFavoritadas: [String]) {

        self.moedasFavoritadas = listaFavoritadas
        colecaoFavoritos.reloadData()
        
    }
    @IBAction func bttnVoltar(_ sender: UIButton) {
        if let acaoRetornar = self.acaoVoltar {
                acaoRetornar()
            } else {
                self.voltarDelegate?.voltar()
            }
            print("-----Opa, vamos voltar")
    }
    
   
}
extension FavoritosViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moedasFavoritadas.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFavoritos = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFavoritos", for: indexPath) as! CollectionViewCell
        colecaoFavoritos.backgroundColor = UIColor.corSecundaria()
//        colecaoFavoritos.bounds.width
        celulaFavoritos.clipsToBounds = true
        celulaFavoritos.layer.cornerRadius = 8
        celulaFavoritos.layer.masksToBounds = true
        celulaFavoritos.contentMode = .scaleToFill
        InfoMoedaAPI().requestInfoMoedas(id: self.moedasFavoritadas[indexPath.row]) { (moeda) in
            celulaFavoritos.formataCelula(moeda[0])
        }
        return celulaFavoritos
    }
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}


extension UIViewController {
    public static var bundleUI: Bundle {
        var bundle: Bundle
        if let bundeLet = Bundle(identifier: "org.cocoapods.Favoritos") {
            bundle = bundeLet
        } else {
            bundle = Bundle(for: self)
        }
        return bundle
    }
    public class func fromSB(_ lista: [String]) -> Self {
        return fromSB(viewType: self)
    }
    public class func fromSB<T: UIViewController>(viewType: T.Type) -> T {
        let storyBoard = UIStoryboard(name: "MainStoryboard", bundle: bundleUI)
        if let viewC = storyBoard.instantiateViewController(withIdentifier: "MainStoryboard") as? T {
            viewC.loadViewIfNeeded()
            return viewC
        }
        return T()
    }
}

