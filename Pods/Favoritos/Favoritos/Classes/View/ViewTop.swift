//
//  ViewTop.swift
//  Favoritos
//
//  Created by Jaqueline Bittencourt Santos on 17/04/21.
//

import UIKit
public protocol FavoritosDelegate: class {
    func viewFavoritosAction()
}

public class ViewTop: UIView {
    
    @IBOutlet weak var MoedaDigital: UILabel!
    @IBOutlet weak var Data: UILabel!
    var favoritoDelegate: FavoritosDelegate?
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
     init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 414, height: 143))
        layoutIfNeeded()
    }

    public func setupUI(delegate: FavoritosDelegate) {
        self.favoritoDelegate = delegate

    }
//    func addTitulo(titulo: String, y: Int, cor: UIColor) {
//        let tituloLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//        tituloLabel.text = titulo
//        tituloLabel.textAlignment = .center
//        tituloLabel.center = CGPoint(x: 160, y: y)
//        tituloLabel.backgroundColor = cor
//        self.addSubview(tituloLabel)
//        self.translatesAutoresizingMaskIntoConstraints = false
//    }
    
}

extension UIView {
    func loadNib() -> UIView {
        let bundle = Bundle.init(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)

        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
