//
//  ViewController.swift
//  testTask
//
//  Created by thisdjango on 25.04.2020.
//  Copyright © 2020 thisdjango. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel = NewsViewModel()
    private var count = 0
    
    // MARK: - public props
    lazy var newsTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.reuseIdentifier)
        table.dataSource = self
        table.delegate = self
        table.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        table.backgroundColor = .white
        return table
    }()
    let refreshControl = UIRefreshControl()
    
    // MARK: - clousers
    var onTableRefresh: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        commonInit()
    }
    
    // MARK: - private funcs
    
    private func configureUI() {
        view.addSubview(newsTable)
        configureNav()
        configureTableView()
    }
    
    private func commonInit() {
        title = ""
        viewModel.onGetting = { [weak self] in
            self?.count = self?.viewModel.dataSource?.count ?? 0
            print("done")
            self?.newsTable.reloadData()
        }
        onTableRefresh = { [weak self] in
            self?.viewModel.grabData()
        }
        viewModel.grabData()
        refreshTable()
    }
    
    func refreshTable() {
        if #available(iOS 10.0, *) {
            newsTable.refreshControl = refreshControl
        } else {
            newsTable.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    }
    
    @objc func reloadData() {
        onTableRefresh?()
    }
    
    private func configureNav() {
        let titleView = UIImageView(image: UIImage(named: "head"))
        navigationItem.titleView = titleView
    }
    
    private  func configureTableView() {
        newsTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        newsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        newsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        newsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        343
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcDetail = DetailViewController()
        vcDetail.data = viewModel.dataSource?[indexPath.row]
        print()
        navigationController?.pushViewController(vcDetail, animated: true)
    }
}
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        cell.news = viewModel.dataSource?[indexPath.row] ?? nil
        return cell
    }
    
    
    
}
