//
//  MenuViewController.swift
//  NY Times
//
//  Created by Lohith on 14/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import UIKit

protocol MenuDelegate : class {
    
    func selectedMenuOption(_ selectedPeriod : Period )
    
}


class MenuViewController: UIViewController {
    
    @IBOutlet var bgView : UIView!
    
    @IBOutlet var menuTable : UITableView!
    
    @IBOutlet var headerLabel : UILabel!
    
    var menuViewModel : MenuViewModel
    
    weak var delegate : MenuDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        uiConfig()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    init(selectedPeriod : Period , delegate : MenuDelegate) {
        
        self.menuViewModel = MenuViewModel(selectedPeriod: selectedPeriod)
        self.delegate = delegate
        super.init(nibName: "MenuViewController", bundle:nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func closeButtonPressed(_ sender : Any){
        
        self.dismiss(animated: true) {
            
        }
    }
    
    
}

extension MenuViewController{
    
    func show(){
        
        guard  let topViewController = UIApplication.shared.topMostViewController() ,
            !topViewController.isKind(of: MenuViewController.self) else {
                return
        }
        
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .custom
        
        topViewController.present(self, animated: true) {
            
        }
        
    }
    
    
    private func uiConfig(){
        
        bgView.backgroundColor = UIColor(named: ColorsStrings.navigationColor)!
        
        headerLabel.text = menuViewModel.screenTitle
        
        intitializeTableView()
    }
    
    private func intitializeTableView()  {
        
        self.menuTable.rowHeight = UITableView.automaticDimension
        self.menuTable.rowHeight = 70
        self.menuTable.separatorStyle = .none
        self.menuTable.separatorColor = UIColor.clear
        self.menuTable.delegate = self
        self.menuTable.dataSource = self
        
        self.menuTable.reloadData()
    }
    
    private func periodGotSelectedAtIndex(_ index : Int){
        
         self.dismiss(animated: true) { [weak self]in
            guard let weakSelf = self else{return}
            
            weakSelf.delegate?.selectedMenuOption(weakSelf.menuViewModel.getSelectedPeriod(index))
                   
        }
    }
    
}

extension MenuViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return  menuViewModel.numberOfRowsAtSection
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let identifier = "MenuLisTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MenuLisTableViewCell
        if cell == nil {
            
            tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MenuLisTableViewCell
            
        }
        
        cell?.displayTextLabel.text = menuViewModel.getCellTextForIndex(indexPath.row)
        
        if menuViewModel.isCellIsSelectedCell(indexPath.row){
            cell?.checkMarkStackView.isHidden = false
        }
        else{
            cell?.checkMarkStackView.isHidden = true
            
        }
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        periodGotSelectedAtIndex(indexPath.row)
        
    }
    
}
