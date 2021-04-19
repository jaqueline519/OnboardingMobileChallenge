//
//  CelulaTableViewCell.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 16/04/21.
//

import UIKit
import ModuloCommons

//public struct infoCelula {
//
//    public static var sigla = ""
//    public var tipo = ""
//    public var cotacao = ""
//    public var img = UIImage()
//    public var favoritado = ""
//}

class CelulaTableViewCell: UITableViewCell {

    @IBOutlet weak var labelMoeda: UILabel!
    @IBOutlet weak var labelTipoMoeda: UILabel!
    @IBOutlet weak var labelCotacaoMoeda: UILabel!
    @IBOutlet weak var imgMoeda: UIImageView!
    @IBOutlet weak var imgFavoritado: UIImageView!
    
    public func populaCelula(_ dados: MoedaInfoElement) {
        
        self.labelMoeda.text = dados.name
        self.labelTipoMoeda.text = dados.assetID
        self.labelCotacaoMoeda.text = "\(dados.priceUsd)"
        self.imgMoeda.image = UIImage()
        self.imgFavoritado.image = UIImage()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   

}
