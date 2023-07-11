//
//  viewControllerFriends.swift
//  Swift-UI
//
//  Created by Ivan Kosenkov on 10.07.2023.
//

import UIKit

extension ViewControllerFriends: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{5}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        cell.textLabel?.text = "Friend №"
//        cell.imageView?.image = UIImage(systemName: "person")
//        return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        guard let cell = cell else {
            return UITableViewCell()
        }
//        if indexPath.row == 0 {
//            cell.accessoryType = .checkmark
//        }
        return cell
    }
}

class ViewControllerFriends: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Friends"
        tableView.dataSource = self
        tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        setupConstraints()
    }

    private var tableView = UITableView(frame: .zero, style: .grouped)

    func setupConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    
    
}
