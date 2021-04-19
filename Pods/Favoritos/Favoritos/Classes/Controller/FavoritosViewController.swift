//
//  FavoritosViewController.swift
//  Favoritos
//
//  Created by Jaqueline Bittencourt Santos on 17/04/21.
//

import UIKit
import Foundation
import ModuloCommons

public class FavoritosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var moedaInfo: [MoedaInfoElement] = []
    var viewTop: ViewTop?
   
    @IBOutlet weak var stackTop: UIStackView!
    
    @IBOutlet weak var colecaoFavoritos: UICollectionView!
    
    @IBOutlet weak var stackFavoritos: UIStackView!
//    var favoritoDelegate: FavoritosDelegate?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        colecaoFavoritos.delegate = self
        colecaoFavoritos.dataSource = self
        setupUI()
    }
    
    func setupUI(){
        let myView = ViewTop().loadNib()
        myView.backgroundColor = .black
        stackTop.addArrangedSubview(myView)
        
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      20
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFavoritos = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFavoritos", for: indexPath) as! CollectionViewCell


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
    public class func fromSB() -> Self {
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

