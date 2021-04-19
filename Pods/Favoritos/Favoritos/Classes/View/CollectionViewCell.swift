//
//  CollectionViewCell.swift
//  Favoritos
//
//  Created by Jaqueline Bittencourt Santos on 17/04/21.
//

import UIKit
import ModuloCommons

class CollectionViewCell: UICollectionViewCell {
   
    var moedaInfo: [MoedaInfoElement] = []
    
    @IBOutlet weak var iconeFavorito: UIImageView!
    
    @IBOutlet weak var nomeMoeda: UILabel?
    @IBOutlet weak var sigla: UILabel?
    @IBOutlet weak var valor: UILabel?

}
