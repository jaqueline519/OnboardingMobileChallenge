//
//  ViewController.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 13/04/21.
//

import UIKit

class ViewController: UIViewController {

    var api = MoedasAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.api.requestMoedas()
    }

}
