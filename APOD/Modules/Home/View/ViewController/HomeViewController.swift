//
//  HomeViewController.swift
//  APOD
//
//  Created by David Molina on 3/02/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Internal Properties
    
    var presenter: HomePresenter?
    var apodList = [Apod]() {
        didSet {
            updateTableView()
        }
    }
    
    // MARK: - Private Properties
    
    private var adapter = HomeAdapter()
    
    // MARK: - LifeCycle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
        presenter = HomePresenter(view: self)
        presenter?.getApods()
        
        adapter.homeAdapterDelegate = self
    }
    
    // MARK: - Private Methods
    
    private func initialSetup() {
        setupNavigationBar()
        registerCell()
        setTableViewDelegates()
    }
    
    private func setupNavigationBar() {
        title = "Astronomy Pictures of the Week"
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.backgroundColor = UIColor.purpleMainColor
        navigationBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: String(describing: CustomTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CustomTableViewCell.self))
    }

    private func setTableViewDelegates() {
        tableView.delegate = adapter
        tableView.dataSource = adapter
    }
    
    private func updateTableView() {
        adapter.apodList = apodList
        tableView.reloadData()
        tableView.isHidden = apodList.isEmpty
    }
    
}

