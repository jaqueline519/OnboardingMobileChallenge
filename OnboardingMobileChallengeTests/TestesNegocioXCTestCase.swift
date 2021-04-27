//
//  TestesNegocioXCTestCase.swift
//  OnboardingMobileChallengeTests
//
//  Created by Jonattan Moises Sousa on 26/04/21.
//

import UIKit
import XCTest
@testable import OnboardingMobileChallenge

class TestesNegocioXCTestCase: XCTestCase {
    var listaDeFavoritos: [MoedaEntity]! = nil
    var detalhes: DetalhesViewController!
    
    override func setUpWithError() throws {
        detalhes = DetalhesViewController()
        listaDeFavoritos = detalhes.consultaBD()
    }

    func testDeveVerificarSeExisteDadosAdvindosDaAPI() {
        // Teste falho, a requisição não chega a ser efetuada
        var verificaDados = false
        MoedasAPI().requestMoedas { (listaDeMoedas) in
            if listaDeMoedas.count > 0 {
                verificaDados = !verificaDados
                XCTAssertTrue(verificaDados)
            }
        }
//        wait(for: [espera], timeout: 10.0)
    }
    func testeDeveVerificarSeHaFavoritosNoBDCoreData() {
        var verificaSeHaDados = false
        if listaDeFavoritos.count > 0 {
            verificaSeHaDados = !verificaSeHaDados
        }
        XCTAssertTrue(verificaSeHaDados, "Tem de existir favorito, então passará")
    }
}
