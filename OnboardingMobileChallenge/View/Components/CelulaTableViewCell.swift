//
//  CelulaTableViewCell.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 16/04/21.
//

import UIKit

class CelulaTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemFavorito: UIImageView!
    @IBOutlet weak var cotacaoMoeda: UILabel!
    @IBOutlet weak var labelSigla: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var labelMoeda: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
