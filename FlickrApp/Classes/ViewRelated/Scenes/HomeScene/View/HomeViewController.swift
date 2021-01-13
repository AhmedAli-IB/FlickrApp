//
//  HomeViewController.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - Properties
    //
    private let viewModel: HomeViewModel = HomeViewModel()
    var coordinator: HomeCoordinatorProtocol?

    // MARK: - IBOutlets
    //
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableView()
        bindLoadingState(to: viewModel)
        bindErrorState(to: viewModel)
        
        configureViewModel()
        viewModel.getPhotos(searchText: "Football")
    }
}
// MARK: - Configuration

private extension HomeViewController {
    
    func configureView() {
        self.title = Strings.title
        self.navigationController?.navigationBar.barTintColor = Asset.Colors.paperColor.color
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
    }
    
    func registerCells() {
        
//        tableView.registerCellNib(HomeTableViewCell.self)
        let cellIdentifier = HomeTableViewCell.classNameWithoutNamespaces
        tableView.register(HomeTableViewCell.loadNib(), forCellReuseIdentifier: cellIdentifier)
    }
    func configureViewModel() {
        viewModel.onReload = { [weak self] in
            guard  let self = self else { return }
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
//
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeue(HomeTableViewCell.self)
//        cell.viewModel = viewModel.getCurrentObject(for: indexPath)
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.classNameWithoutNamespaces,
                                                 for: indexPath) as? HomeTableViewCell
        guard let homeCell = cell else {
            fatalError("Unexpected cell sent to \(#function)")
        }
        homeCell.viewModel = viewModel.getCurrentObject(for: indexPath)
        return homeCell
    }
}
// MARK: - UITableViewDelegate
//
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.heightForRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = viewModel.getCurrentObject(for: indexPath)
        coordinator?.showDetails(photo: photo)
    }
}

// MARK: - Constants
//
private extension HomeViewController {
    enum Constants {
        static let heightForRow = CGFloat(200)
    }
}

// MARK: - Strings
//
private extension HomeViewController {
    enum Strings {
       static var title = "Home 🤟📸"
   }
}
