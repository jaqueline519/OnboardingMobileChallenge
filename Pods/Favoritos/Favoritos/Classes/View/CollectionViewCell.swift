//
//  CollectionViewCell.swift
//  Favoritos
//
//  Created by Jaqueline Bittencourt Santos on 17/04/21.
//

import UIKit
import ModuloCommons
import Alamofire
import AlamofireImage

class CollectionViewCell: UICollectionViewCell {
   
    var moedaInfo: [MoedaInfoElement] = []
    
    @IBOutlet weak var iconeFavorito: UIImageView!
    
    @IBOutlet weak var viewImagem: UIView!
    @IBOutlet weak var viewInterna: UIView!
    @IBOutlet weak var nomeMoeda: UILabel?
    @IBOutlet weak var sigla: UILabel?
    @IBOutlet weak var valor: UILabel?
    
    func formataCelula(_ moeda: MoedaInfoElement) {
//        self.bounds.size.width = CGFloat(100)
        self.viewInterna.backgroundColor = UIColor.corPrimaria()
        self.viewInterna.layer.cornerRadius = 10
        self.viewImagem.clipsToBounds = true
        guard let image = DataImage().requestImageUrl(moeda.idIcon) else { return }
        self.iconeFavorito.af.setImage(withURL: image)
        self.iconeFavorito.layer.cornerRadius =  self.viewImagem.frame.width / 2 + 8
        self.nomeMoeda?.text = moeda.name
        self.sigla?.text = moeda.assetID
        self.valor?.text = moeda.priceUsd.formatDolar  // "\(moeda.priceUsd)"
    }

}
