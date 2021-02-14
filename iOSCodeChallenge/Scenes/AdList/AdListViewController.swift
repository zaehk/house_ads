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
        refreshControl?.attributedTitle = NSAttributedString(string: Literals.Common.refreshControlDescription)
        refreshControl?.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
    }
    
    private func setupView(){
        self.title = Literals.AdList.title
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
    
    func showRealStateAds(viewModel: AdListViewModel) {
        //spinner.dismiss()
        updateCellsToShow(newCells: viewModel.cellModelsToShow)
    }
    
    func showEmptyState(viewModel: AdListViewModel) {
        //spinner.dismiss()
        //we are using the same cells and flow to show the empty state but is separated in a different method so we could give it a customized behaviour if wanted (showing an alert...)
        updateCellsToShow(newCells: viewModel.cellModelsToShow)
    }
    
}

//MARK: -TableViewDataSource & Delegate

extension AdListViewController {
    
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
