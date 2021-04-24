//
//  FavoritosViewController.swift
//  Favoritos
//
//  Created by Jaqueline Bittencourt Santos on 17/04/21.
//

import UIKit
import Foundation
import ModuloCommons

public class FavoritosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var moedaInfo: [MoedaInfoElement] = []
//    var viewTop: ViewTop?
    public var moedasFavoritadas = ["BTC","ETH","PLN","AUD"]
    
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
    
    public override func viewWillAppear(_ animated: Bool) {
//        setupUI()
    }
    func configuraView(titulo: String, y: Int, cor: UIColor) {
        let tituloLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        tituloLabel.text = String()
        tituloLabel.textAlignment = .center
        tituloLabel.backgroundColor = .corTexto()
       stackTop.addArrangedSubview(tituloLabel)
        
        let myView = ViewTop().loadNib()
        myView.backgroundColor = .corSecundaria()
        stackTop.addArrangedSubview(myView)
    }
    
    public func setupUI(_ listaFavoritadas: [String]) {

        self.moedasFavoritadas = listaFavoritadas
        colecaoFavoritos.reloadData()
        
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moedasFavoritadas.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFavoritos = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFavoritos", for: indexPath) as! CollectionViewCell
        celulaFavoritos.backgroundColor = UIColor.black
        colecaoFavoritos.backgroundColor = UIColor.corSecundaria()
        celulaFavoritos.clipsToBounds = true
        celulaFavoritos.layer.cornerRadius = 8
        celulaFavoritos.layer.masksToBounds = true
        celulaFavoritos.contentMode = .scaleToFill
        InfoMoedaAPI().requestInfoMoedas(id: self.moedasFavoritadas[indexPath.row]) { (moeda) in
            celulaFavoritos.formataCelula(moeda[0])
        }


        return celulaFavoritos
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
//    public class func fromNib() -> Self {
//        return fromNib(viewType: self)
//    }
//    public class func fromNib<T: UIView>(viewType: T.Type) -> T {
//        if let nib = bundleUI.loadNibNamed(String(describing: viewType), owner: nil, options: nil)?.first as? T {
//            return nib
//        }
//        return T()
//    }
}

