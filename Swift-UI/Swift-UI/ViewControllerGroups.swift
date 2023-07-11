//
//  viewControllerFriends.swift
//  Swift-UI
//
//  Created by Ivan Kosenkov on 10.07.2023.
//

import UIKit

extension ViewControllerGroups: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{5}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = "Group №"
        cell.detailTextLabel?.text = "Test number"
        cell.imageView?.image = UIImage(systemName: "heart")
        return cell
    }
}

class ViewControllerGroups: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Groups"
        tableView.dataSource = self

        view.addSubview(tableView)
        setupConstraints()
    }
 
    private var tableView = UITableView(frame: .zero, style: .grouped)
    
    func setupConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
}
