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
        let listaFavoritos = DetalhesViewController().consultaBD()
        var verificaSeHaDados = false
        if listaFavoritos.count > 0 {
            verificaSeHaDados = !verificaSeHaDados
        }
        XCTAssertTrue(verificaSeHaDados)
    }
}
