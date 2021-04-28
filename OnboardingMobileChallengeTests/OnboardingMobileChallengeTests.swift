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
    
    override func setUpWithError() throws {
        //
    }
    func testAppDelegate() {
        AppDelegate().saveContext()
        _ = AppDelegate().persistentContainer
    }
    
}
