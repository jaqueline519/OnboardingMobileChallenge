//
//  ViewController.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 13/04/21.
//

import UIKit

class TelaPrincipalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var listaMoedasTableView: UITableView!
    
    var api = MoedasAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.api.requestMoedas()
        self.listaMoedasTableView.delegate = self
        self.listaMoedasTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CelulaTableViewCell", for: indexPath) as? CelulaTableViewCell
        
        return cell ?? CelulaTableViewCell()
    }


}
