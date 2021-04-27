//
//  HomeTableTableViewControllerTests.swift
//  OnboardingMobileChallengeTests
//
//  Created by Jonattan Moises Sousa on 27/04/21.
//

import XCTest
import ModuloCommons
import ModuloDetalhes
@testable import OnboardingMobileChallenge

class HomeTableTableViewControllerTests: XCTestCase {
    var homeController: HomeTableTableViewController!
    let verificador = 5
    var dado: ListaMoeda! = nil

    override func setUp() {
        homeController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeTable") as? HomeTableTableViewController
        _ = homeController.view
        
        dado = ListaMoeda(assetID: "BTC", name: "Bitcoin", typeIsCrypto: 1, dataStart: "2021", dataEnd: "2022", dataQuoteStart: "2010", dataQuoteEnd: "2011", dataOrderbookStart: "1995", dataOrderbookEnd: "1890", dataTradeStart: "2001", dataTradeEnd: "2005", dataSymbolsCount: 2, volume1HrsUsd: 20.0, volume1DayUsd: 50.5, volume1MthUsd: 30.2, priceUsd: 19900.0, idIcon: "sucesso")
        
        for _ in 1...verificador {
            homeController.dadosListaMoedas.append(dado)
        }
    }
    
    func testSeNumeroDeLinhasDaTabelaIgualACinco() {
        XCTAssertEqual(homeController.tableView.numberOfRows(inSection: 0), 5, "Numero de linhas da tabela sendo igual ao valor atribuido em varificador, cinco")
    }
    

}
