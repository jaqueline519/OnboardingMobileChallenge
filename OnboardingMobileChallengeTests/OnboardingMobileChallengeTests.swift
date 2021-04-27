//
//  OnboardingMobileChallengeTests.swift
//  OnboardingMobileChallengeTests
//
//  Created by Jaqueline Bittencourt Santos on 13/04/21.
//

import XCTest
import ModuloCommons
import ModuloDetalhes
@testable import OnboardingMobileChallenge

class OnboardingMobileChallengeTests: XCTestCase {

    var detalhesVC: DetalhesViewController!
    var homeTvCell: HomeUITableViewCell!
    var dado: ListaMoeda! = nil
    
    override func setUpWithError() throws {
        dado = ListaMoeda(assetID: "BTC", name: "Bitcoin", typeIsCrypto: 1, dataStart: "2021", dataEnd: "2022", dataQuoteStart: "2010", dataQuoteEnd: "2011", dataOrderbookStart: "1995", dataOrderbookEnd: "1890", dataTradeStart: "2001", dataTradeEnd: "2005", dataSymbolsCount: 2, volume1HrsUsd: 20.0, volume1DayUsd: 50.5, volume1MthUsd: 30.2, priceUsd: 19900.0, idIcon: "sucesso")
        detalhesVC = DetalhesViewController()
        homeTvCell = HomeUITableViewCell()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testFavoritosScreen() {
        FavoritosScreenViewController().recuperaFavoritos()
        FavoritosScreenViewController().showDetailsAction()
    }
    func testAppDelegate() {
        AppDelegate().saveContext()
        _ = AppDelegate().persistentContainer
    }
    func testFuncoesDetalhesViewController() {
        _ = detalhesVC.verificaSeFavorito("ETH")
        _ = detalhesVC.consultaBD()
        detalhesVC.addFavorito("ETH")
        detalhesVC.removeFavorito("ETH")
        _ = detalhesVC.resgateFavoritos()
        detalhesVC.atualizaBD()
    }
}
