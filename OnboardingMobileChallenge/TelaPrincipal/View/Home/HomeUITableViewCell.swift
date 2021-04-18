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

    func configCell(_ dados: ListaMoeda) {
        self.imgMoeda.image = UIImage()
        self.lbNomeMoeda.text = dados.name
        self.lbTipoMoeda.text = dados.assetID
        self.imgFavorito.image = UIImage()
        if let preco = dados.priceUsd {
//            self.lbCotacaoMoeda.text = String(format: "$ %.2f", preco)
            self.lbCotacaoMoeda.text = preco.formatadorDolar(valor: preco)
        } else {
            self.lbCotacaoMoeda.text = "0"
        }
        self.configCorCell()
    }
    
    private func formatador2(valor: Double) -> String {
        let valorFormatado = NumberFormatter.localizedString(from: 999999.99, number: .currency)
        
        return valorFormatado
    }
    
    private func formatador(valor: Double) -> String {
        let valorNS = NSNumber(value: valor)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        guard let valorFormatado = formatter.string(from: valorNS) else { return "0"}
//        formatter.numberStyle = .decimal
//        formatter.minimumFractionDigits = 2
//        formatter.maximumFractionDigits = 3
//        guard let valorFormatado = formatter.string(for: valor) else { return "0"}
        return valorFormatado
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
