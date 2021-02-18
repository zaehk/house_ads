//
//  AdListViewController.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.


import UIKit

protocol AdListDisplayLogic: class
{
    func showRealStateAds(viewModel: AdListViewModel)
    func showEmptyState(viewModel: AdListViewModel)
    func updateCell(cellModel: DrawerItemProtocol, atIndex: Int)
}

class AdListViewController: UITableViewController
{
    
    var interactor: AdListBusinessLogic?
    var router: (NSObjectProtocol & AdListRoutingLogic & AdListDataPassing)?
    
    private var cellModels: [DrawerItemProtocol] = []    
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupView()
        setupTableSettings()
        getRealStateAds(showSpinner: true)
    }
    
    private func setupTableSettings(){
        self.refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: Literals.Common.refreshControlDescription)
        refreshControl?.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 200
    }
    
    private func setupView(){
        self.title = Literals.AdList.title
        self.view.backgroundColor = .white
    }
    
    @objc func refresh(_ sender: AnyObject) {
        getRealStateAds(showSpinner: false)
    }
    
    private func getRealStateAds(showSpinner: Bool){
        if showSpinner {
            //spinner.show
        }
        interactor?.fetchRealStateAds()
    }
    
    private func updateCellsToShow(newCells: [DrawerItemProtocol]){
        self.cellModels = newCells
        tableView.reloadData()
    }
    
}

//MARK: -AdListDisplayLogic

extension AdListViewController: AdListDisplayLogic {
    
    func updateCell(cellModel: DrawerItemProtocol, atIndex: Int) {
        self.cellModels[atIndex] = cellModel
        tableView.reloadRows(at: [IndexPath.init(item: atIndex, section: 0)], with: .fade)
    }
    
    func showRealStateAds(viewModel: AdListViewModel) {
        refreshControl?.endRefreshing()
        //spinner.dismiss()
        updateCellsToShow(newCells: viewModel.cellModelsToShow)
    }
    
    func showEmptyState(viewModel: AdListViewModel) {
        refreshControl?.endRefreshing()
        //spinner.dismiss()
        //we are using the same cells and flow to show the empty state but is separated in a different method so we could give it a customized behaviour if wanted (showing an alert...)
        updateCellsToShow(newCells: viewModel.cellModelsToShow)
    }
    
}

//MARK: -TableViewDataSource & Delegate

extension AdListViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if cellModels[indexPath.row] is EmptyStateCellModel {
            return tableView.frame.height
        } else {
            return  UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = cellModels[indexPath.row]
        let drawer = cellModel.cellDrawer
        
        //dequeue the cell using the cellModel's drawer protocol
        let cell = drawer.dequeueCell(tableView, cellForRowAt: indexPath)
        
        //draw the cell using its drawer class, so all the drawing logic is separated from the cell that only serves as a container for views and public setters
        drawer.drawCell(cell, withItem: cellModel, delegate: self, at: indexPath)
        
        //return the cell already drawn without knowing wich kind of cell are we displaying so we can mix different cells in the same array without affecting this implementation and no changes would be required
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.navigateToAdDetail(adIndex: indexPath.row)
    }
    
}

extension AdListViewController: AdTableViewCellFavoriteProtocol {
    
    func favButtonTapped(currentIndex: Int) {
        interactor?.toggleFavoriteStatus(index: currentIndex)
    }
    
}
