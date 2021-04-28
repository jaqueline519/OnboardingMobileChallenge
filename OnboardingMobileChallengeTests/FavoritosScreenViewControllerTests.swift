//
//  FavoritosScreenViewControllerTests.swift
//  OnboardingMobileChallengeTests
//
//  Created by Jonattan Moises Sousa on 27/04/21.
//

import XCTest
@testable import OnboardingMobileChallenge

class FavoritosScreenViewControllerTests: XCTestCase {
    
    var favoritoVC: FavoritosScreenViewController!
    override func setUp() {
        favoritoVC = FavoritosScreenViewController()
    }
    func testCarregamentoDeFuncoes() {
        favoritoVC.recuperaFavoritos()
        favoritoVC.showDetailsAction()
    }

}
