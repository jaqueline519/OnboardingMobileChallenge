//
//  FavoritosScreenViewController.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 18/04/21.
//

import UIKit
import Favoritos

class FavoritosScreenViewController: UIViewController {
    
    @IBOutlet weak var stackFavoritos: UIStackView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showDetailsAction()
        
    }
    
        func showDetailsAction() {
            let viewC = FavoritosViewController.fromSB()
            self.present(viewC, animated: true, completion: nil)
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }

}

