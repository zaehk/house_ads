//
//  FavoriteAdsListSnapshotTesting.swift
//  iOSCodeChallengeTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 21/2/21.
//

@testable import iOSCodeChallenge
import SnapshotTesting
import XCTest

class FavoriteAdsListSnapshotTest: XCTestCase {
    
    func testFavoriteAdsListViewController() {
        let vc = FavoriteAdsListViewController()
        let presenter = FavoriteAdsListPresenter()
        presenter.viewController = vc
        
        let adListResults: IDResultsDTO = JSONMockDecoder.decode(mock: "idResultList")
        
        
        presenter.presentFavoriteAds(ads: adListResults.elementList)
        
        assertSnapshot(matching: vc, as: .image(on: .iPhoneX), record: false)
    }

}
