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
    
    @IBOutlet weak var nomeMoeda: UILabel?
    @IBOutlet weak var sigla: UILabel?
    @IBOutlet weak var valor: UILabel?
    
    func formataCelula(_ moeda: MoedaInfoElement) {
        guard let image = DataImage().requestImageUrl(moeda.idIcon) else { return }
        self.iconeFavorito.af.setImage(withURL: image)
        self.nomeMoeda?.text = moeda.name
        self.sigla?.text = moeda.assetID
        self.valor?.text = "\(moeda.priceUsd)"
    }

}
