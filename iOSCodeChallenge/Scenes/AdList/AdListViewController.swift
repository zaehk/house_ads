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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getRealStateAds()
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
        getRealStateAds()
    }
    
    private func getRealStateAds(){
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
        updateCellsToShow(newCells: viewModel.cellModelsToShow)
    }
    
    func showEmptyState(viewModel: AdListViewModel) {
        refreshControl?.endRefreshing()
        //we are using the same cells variable and flow to show the empty state but is separated in a different method so we could give it a customized behaviour if wanted (showing an alert. spinner...)
        updateCellsToShow(newCells: viewModel.cellModelsToShow)
    }
    
}

//MARK: -TableViewDataSource & Delegate

extension AdListViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if cellModels[indexPath.row] is EmptyStateCellModel {
            //if the cell about to be displayed is an empty state cell, we want it to cover the whole table
            return tableView.frame.height
        } else {
            //if not, the tableview cell has its own size and we dont want to change it (it could vary from cell to cell if we wanted to)
            return  UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.dequeue the cell using the cellModel's drawer protocol
        //2.draw the cell using its drawer class, so all the drawing logic is separated from the cell that only serves as a container for views and public setters
        //3.return the cell already drawn without knowing wich kind of cell are we displaying so we can mix different cells in the same array without affecting this implementation and no changes would be required
        //For example we could show different cells for renting and for sale if the info could be different.
        
        let cellModel = cellModels[indexPath.row]
        let drawer = cellModel.cellDrawer
        let cell = drawer.dequeueCell(tableView, cellForRowAt: indexPath)
        drawer.drawCell(cell, withItem: cellModel, delegate: self, at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if cellModels[indexPath.row] is AdCellModel {
            router?.navigateToAdDetail(adIndex: indexPath.row)
        }
    }
    
}

extension AdListViewController: AdTableViewCellFavoriteProtocol {
    
    func collectionImageTapped(currentIndex: Int) {
        router?.navigateToAdDetail(adIndex: currentIndex)
    }
    
    func favButtonTapped(currentIndex: Int) {
        interactor?.toggleFavoriteStatus(index: currentIndex)
    }
    
}
