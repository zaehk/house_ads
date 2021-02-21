//
//  AdDetailSnapshotTesting.swift
//  iOSCodeChallengeTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 21/2/21.
//

@testable import iOSCodeChallenge
import SnapshotTesting
import XCTest

class AdDetailSnapshotTest: XCTestCase {
    
    func testAdDetailViewController() {
        let vc = AdDetailViewController()
        let adDetailResultDTO: IDDetailDTO = JSONMockDecoder.decode(mock: "idAdDetail")
        let adDetailViewModel = AdDetailViewModel.init(idDetailDTO: adDetailResultDTO, isFavorite: true)
        vc.showAdDetail(viewModel: adDetailViewModel)
        assertSnapshot(matching: vc, as: .image(on: .iPhoneX), record: false)
    }

}

