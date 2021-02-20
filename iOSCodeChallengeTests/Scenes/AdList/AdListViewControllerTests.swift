//
//  AdListViewControllerTests.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


@testable import iOSCodeChallenge
import XCTest

class AdListViewControllerTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: AdListViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        window = UIWindow()
        setupAdListViewController()
    }
    
    override func tearDown()
    {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupAdListViewController()
    {
        
        sut = AdListViewController()
    }
    
    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class AdListBusinessLogicSpy: AdListBusinessLogic
    {
        var fetchRealStateAdsCalled = false
        var toggleFavoriteStatusCalled = false
        
        func fetchRealStateAds(){
            fetchRealStateAdsCalled = true
        }
        
        func toggleFavoriteStatus(index: Int){
            toggleFavoriteStatusCalled = true
        }
    }
    
    // MARK: Tests
    
    func testShouldFetchAdListWhenViewIsLoaded()
    {
        // Given
        let spy = AdListBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        
        // Then
        XCTAssertTrue(spy.fetchRealStateAdsCalled, "viewDidLoad() should ask the interactor to fetch the list of ads")
    }
    
    func testShowRealStateAds()
    {
        let idResult1: IDResultDTO = JSONMockDecoder.decode(mock: "idResultDTO")
        let resultVM = AdViewModel.init(listDTO: idResult1, favorite: true)
        let cellModel = AdCellModel.init(adViewModel: resultVM)
        
        // Given
        let viewModel = AdListViewModel(cellModelsToShow: [
            cellModel, cellModel, cellModel
        ])
        
        // When
        loadView()
        sut.showRealStateAds(viewModel: viewModel)
        
        // Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), viewModel.cellModelsToShow.count, "showRealStateAds() should reload the tableview with the same number of cellmodels included in the viewmodel")
    }
    
    func testShowEmptyState()
    {
        // Given
        let viewModel = AdListViewModel(cellModelsToShow: [EmptyStateCellModel.init(emptyState: .adList)])
        
        // When
        loadView()
        sut.showEmptyState(viewModel: viewModel)
        
        // Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), viewModel.cellModelsToShow.count, "showEmptyState() should reload the tableview with only one cell (emptyStateCell)")
        
        XCTAssertTrue(sut.tableView.cellForRow(at: IndexPath.init(item: 0, section: 0)) is EmptyStateCell, "showEmptyState() should load a cell of type EmptyStateCell in the tableView")
        
    }
    
}
