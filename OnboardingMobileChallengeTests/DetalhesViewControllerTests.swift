//
//  DetalhesViewControllerTests.swift
//  OnboardingMobileChallengeTests
//
//  Created by Jonattan Moises Sousa on 27/04/21.
//

import XCTest
@testable import OnboardingMobileChallenge

class DetalhesViewControllerTests: XCTestCase {
    var detalhesVC: DetalhesViewController!
    
    override func setUp() {
        detalhesVC = DetalhesViewController()
    }
    func testCarregamentoDeFuncoesDetalhesViewController() {
        _ = detalhesVC.consultaBD()
        detalhesVC.atualizaBD()
        detalhesVC.addFavorito("ETH")
        _ = detalhesVC.verificaSeFavorito("ETH")
        detalhesVC.removeFavorito("ETH")
        _ = detalhesVC.resgateFavoritos()
        detalhesVC.removeTodosOsFavoritos()
    }
}
