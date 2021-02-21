//
//  AdListSnapshotTesting.swift
//  iOSCodeChallengeTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 21/2/21.
//

@testable import iOSCodeChallenge
import SnapshotTesting
import XCTest

class AdListSnapshotTest: XCTestCase {
    
    func testAdListViewController() {
        let vc = AdListViewController()
        let presenter = AdListPresenter()
        presenter.viewController = vc
        
        let adListResults: IDResultsDTO = JSONMockDecoder.decode(mock: "idResultList")
        let presentableResults = adListResults.elementList.map({($0,true)})
        
        presenter.presentRealStateAds(response: presentableResults)
        
        assertSnapshot(matching: vc, as: .image(on: .iPhoneX), record: false)
    }

}
