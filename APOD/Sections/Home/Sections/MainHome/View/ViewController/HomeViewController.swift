//
//  HomeViewController.swift
//  APOD
//
//  Created by W.D. on 3/02/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Internal Properties
    
    var presenter: MainPresenter?
    var apodList = [Apod]() {
        didSet {
            adapter.apodList = apodList
            tableView.reloadData()
            tableView.isHidden = apodList.isEmpty
        }
    }
    
    // MARK: - Private Properties
    
    private var adapter = HomeAdapter()
    
    // MARK: - LifeCycle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        presenter = MainPresenter(view: self)
        presenter?.getApods()
        
        tableView.register(UINib(nibName: String(describing: CustomTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CustomTableViewCell.self))
        
        tableView.delegate = adapter
        tableView.dataSource = adapter
        adapter.delegate = self
    }
    
    // MARK: - LifeCycle ViewController
    
    private func setupNavigationBar() {
        title = "Astronomy Pictures of the Week"
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.backgroundColor = UIColor.purpleMainColor
        navigationBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}

