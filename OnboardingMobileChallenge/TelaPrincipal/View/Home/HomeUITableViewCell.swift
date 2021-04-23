//
//  HomeUITableViewCell.swift
//  OnboardingMobileChallenge
//
//  Created by Jonattan Moises Sousa on 18/04/21.
//

import UIKit
import ModuloCommons

class HomeUITableViewCell: UITableViewCell {
    @IBOutlet weak var imgMoeda: UIImageView!
    @IBOutlet weak var lbNomeMoeda: UILabel!
    @IBOutlet weak var lbTipoMoeda: UILabel!
    @IBOutlet weak var imgFavorito: UIImageView!
    @IBOutlet weak var lbCotacaoMoeda: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(_ dados: ListaMoeda, _ nomeImagem: URL) {
        self.imgMoeda.af.setImage(withURL: nomeImagem) // = DataImage().requestImage(nomeImagem)
        self.lbNomeMoeda.text = dados.name
        self.lbTipoMoeda.text = dados.assetID
        self.imgFavorito.image = UIImage()
        let valor = dados.priceUsd ?? 0.0
        self.lbCotacaoMoeda.text = valor.formatDolar
        self.configCorCell()
    }
    private func configCorCell() {
        self.backgroundColor = UIColor.corSecundaria()
        self.lbNomeMoeda.textColor = UIColor.corTexto()
        self.lbTipoMoeda.textColor = UIColor.corTexto()
        self.lbCotacaoMoeda.textColor = UIColor.corTexto()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
