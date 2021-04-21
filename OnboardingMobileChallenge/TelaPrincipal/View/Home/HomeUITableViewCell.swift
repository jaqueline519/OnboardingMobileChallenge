//
//  HomeUITableViewCell.swift
//  OnboardingMobileChallenge
//
//  Created by Jonattan Moises Sousa on 18/04/21.
//

import UIKit

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

    func configCell(_ dados: ListaMoeda, _ urlImagem: URL) {
        self.imgMoeda.af.setImage(withURL: urlImagem) // mudar para urlImagem
        self.lbNomeMoeda.text = dados.name
        self.lbTipoMoeda.text = dados.assetID
        self.imgFavorito.image = UIImage()
        if let preco = dados.priceUsd { // melhorar
            self.lbCotacaoMoeda.text = preco.formatadorDolar(valor: preco)
        } else {
            self.lbCotacaoMoeda.text = "0"
        }
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
