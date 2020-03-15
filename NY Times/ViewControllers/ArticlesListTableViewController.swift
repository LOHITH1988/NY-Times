//
//  ArticlesListTableViewController.swift
//  NY Times
//
//  Created by Lohith on 13/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import Foundation
import UIKit

class ArticlesListTableViewController : UITableViewController{
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let searchController = UISearchController(searchResultsController: nil)

    
    var newsArticleListViewModel = NewsArticleListViewModel()
    
    var webservice = Webservice()
    
    
    var viewState: ViewState = .none {
        
        willSet(newValue) {
            
            switch newValue {
            
            case .none:
                
                break
                
            case .loading:
                
                dataIsLoading()
                
            case .loaded:
                
                dataGotLoaded()
                
            case .error(let errorString):
                
                errorGotFromWesService(errorString)
                
            }
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        getAllNewsArticles()
        addSearchController()
        
    }
    
    @IBAction func refreshNewsListButtonAction(){
        
        
        getAllNewsArticles()

        
    }
    
    @IBAction func menuButtonAction(){
           
        let menuViewController = MenuViewController(selectedPeriod: newsArticleListViewModel.getPeriod(), delegate: self)
        menuViewController.show()

           
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return newsArticleListViewModel.numberOfSections
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArticleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsArticleTableViewCell", for: indexPath) as? NewsArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.newsArticleListViewModel.articleAtIndex(indexPath.row)
        cell.configureCell(articleVM)
        return cell
    }
    
}

extension ArticlesListTableViewController {
    
    private func configureUI(){
        title = newsArticleListViewModel.screenTitle
    }
    
    private func addSearchController(){
        
        searchController.searchBar.barStyle = .black
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
    }
    
    
    private func getAllNewsArticles(){
        
        guard let resorce = newsArticleListViewModel.getResouce() else{
            viewState = .error("Invalid URL")
            return
        }
        
        
        if viewState.isLoading {
            return
        }
        viewState = .loading
        
        webservice.load(resource: resorce) {[weak self]result in
            
            guard let weakSelf = self else{return}
            
            switch result{
            case .failure(let error):
                
                weakSelf.viewState = .error(error.localizedDescription)
                
            case .success(let article):
                
                weakSelf.newsArticleListViewModel.newNewsList(article)
                weakSelf.viewState = .loaded
            }
        }
        
    }
    
    
    private func dataIsLoading(){
        
        DispatchQueue.main.async { [weak self] in
        
            
            self?.activityIndicator.isHidden = false
            self?.activityIndicator.startAnimating()
            
        }
    }
    
    private func dataGotLoaded(){
        
        DispatchQueue.main.async { [weak self] in
        

            self?.activityIndicator.isHidden = true
            self?.activityIndicator.stopAnimating()
            self?.tableView.reloadData()
            
        }
        
    }
    
    private func errorGotFromWesService( _ errorMessage : String){
        
        DispatchQueue.main.async { [weak self] in
        
            self?.activityIndicator.isHidden = true
            self?.activityIndicator.stopAnimating()
            
            self?.showErrorAlert(message: errorMessage)

            // error message
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailsView_segue" {
            
            
            guard let cell = sender as? NewsArticleTableViewCell , let indexPath = tableView.indexPath(for: cell) , let destinationViewController = segue.destination as? ArticleDetailWebViewController else{
                return
            }
            
            destinationViewController.articleView = newsArticleListViewModel.articleAtIndex(indexPath.row)
            
            
        }
    }
    
}


extension ArticlesListTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
       
        if let text = searchController.searchBar.text, !text.isEmpty  , !viewState.isLoading {
            
            newsArticleListViewModel.filterNews(text)
            
        }
        else{
            
            newsArticleListViewModel.clearFilter()
        }
        self.tableView.reloadData()
    }
}

extension ArticlesListTableViewController : MenuDelegate{
    
    func selectedMenuOption(_ selectedPeriod: Period) {
        
        newsArticleListViewModel.setPeriod(selectedPeriod)
        newsArticleListViewModel.clearFilter()
        searchController.searchBar.endEditing(true)
        tableView.reloadData()
        getAllNewsArticles()

        
        
    }
    
    
}
